export function linkValidator(link) {
  const regex = /(((https?:\/\/)|(www\.))[^\s]+)/g;
  return link.length != 0 && regex.test(link);
};
