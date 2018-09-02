export function linkValidator(link) {
  const regex = /(((https?:\/\/)|(www\.))[^\s]+)/g;
  return link.length != 0 && regex.test(link);
};

export function generateShortCode() {
  let text = '';
  const possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  for (let i = 0; i < 6; i++) {
    text += possible.charAt(Math.floor(Math.random() * possible.length));
  }

  return text;
};
