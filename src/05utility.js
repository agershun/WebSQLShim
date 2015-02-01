/**
	Extend an object with another object properties
*/
function extend (a,b){
    if(typeof a == 'undefined') a = {};
    for(key in b) {
        if(b.hasOwnProperty(key)) {
            a[key] = b[key]
        }
    }
    return a;
};

/**
	Remove star-slash multiline comments from the string
*/
function uncomment(str) {
	str = ('__' + str + '__').split('');
	var quote = false,
		quoteSign,
		blockComment = false,
		lineComment = false;

	for (var i = 0, l = str.length; i < l; i++) {
		var unescaped = str[i - 1] !== '\\' || str[i - 2] === '\\';

		if (quote) {
			if (str[i] === quoteSign && unescaped)
				quote = false;
		} else if (blockComment) {
			if (str[i] === '*' && str[i + 1] === '/') {
					str[i] = str[i + 1] = '';
				blockComment = false;
				i++;
			} else { 
				str[i] = '';
			}
		} else if (lineComment) {
			if (str[i + 1] == '\n' || str[i + 1] == '\r')
				lineComment = false;
			str[i] = '';
		} else {
			if (str[i] == '"' || str[i] == "'") {
				quote = true;
				quoteSign = str[i];
			} else if (str[i] == '[' && str[i-1] != "@") {
				quote = true;
				quoteSign = ']';
			} else if (str[i] === '/' && str[i + 1] === '*') {
						str[i] = '';
					blockComment = true;
			}
		}
	}
	str = str.join('').slice(2, -2);
	return str;
};
