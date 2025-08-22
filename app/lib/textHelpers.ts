// Helper function to clean HTML from text content
export const cleanHtmlText = (htmlString: string): string => {
    if (!htmlString || typeof htmlString !== 'string') return '';
    
    // Remove HTML tags and decode entities
    const cleaned = htmlString
    .replace(/<[^>]*>/g, '') // Remove HTML tags
    .replace(/&nbsp;/g, ' ') // Replace non-breaking spaces
    .replace(/&amp;/g, '&')  // Replace HTML entities
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/\s+/g, ' ')    // Replace multiple spaces with single space
    .trim();                 // Remove leading/trailing whitespace
    
    return cleaned;
};

// Helper function to extract text from language objects (same as HotelsContext)
export const extractLanguageText = (languageObj: any, defaultText = ''): string => {
    if (!languageObj) return defaultText;

    // If it's already a string, clean HTML and return it
    if (typeof languageObj === 'string') {
        return cleanHtmlText(languageObj);
    }

    // If it has a language array, get the first one or find English
    if (languageObj.language && Array.isArray(languageObj.language)) {
        const languages = languageObj.language;
        
        // Try to find English first (ID 1 is usually English)
        const englishLang = languages.find(lang => 
        lang['@_id'] === '1' || lang['@_id'] === 1
        );
        if (englishLang && englishLang['#text']) {
        return cleanHtmlText(englishLang['#text']);
        }
        
        // Fall back to first language with text
        const firstLang = languages.find(lang => lang['#text']);
        if (firstLang && firstLang['#text']) {
        return cleanHtmlText(firstLang['#text']);
        }
    }

    // If it's a single language object
    if (languageObj['#text']) {
        return cleanHtmlText(languageObj['#text']);
    }

    return defaultText;
};

// Helper function to safely extract text from nested objects (fallback)
export const extractText = (value: any, defaultText = '') => {
    if (typeof value === 'string') return cleanHtmlText(value.trim());
    if (value && typeof value === 'object') {
        if (value['#text']) {
        const text = value['#text'];
        return typeof text === 'string' ? cleanHtmlText(text.trim()) : cleanHtmlText(String(text).trim());
        }
        if (value.language && value.language['#text']) {
        const text = value.language['#text'];
        return typeof text === 'string' ? cleanHtmlText(text.trim()) : cleanHtmlText(String(text).trim());
        }
        return cleanHtmlText(String(value).trim());
    }
    return defaultText;
};