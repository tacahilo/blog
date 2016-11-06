content: clean scss
	hugo -v
	gzip -k9 public/sitemap.xml

scss:
	rm -f static/css/style.css
	compass compile scss

clean:
	rm -rf public

deploy: content
	rsync -rlpgoDcv --delete public/ core@blog.hifumi.info:/srv/site/

deployn: content
	rsync -n -rlpgoDcv --delete public/ core@blog.hifumi.info:/srv/site/

.PHONY: scss content clean
