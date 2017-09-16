do

function run(msg, matches)
	return "˜?Ñã Êæ Çæä ääå ÌäÏÊ" .. matches[1]
end
end
return {
  description = "Says Hello to Someone", 
  usage = "Say Hello to (name)",
  patterns = {
    "^fosh (.*) ",
	"^Cuss (.*) ",
  }, 
  run = run 
}
