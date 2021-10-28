

jamq: front-door.rkt package-lock.json
	rm -rf build
	raco  exe front-door.rkt
	raco distribute build front-door 
	docker build -t jamq1 .

package-lock.json: package.json
	npm i

test: front-door.rkt
	rm -rf build
	raco test test_middleware.rkt
	
clean:
	rm -rf build front-door 

distclean:
	rm -rf build compiled front-door node_modules package-lock.json *~
