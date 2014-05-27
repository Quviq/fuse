PROJECT = fuse

.DEFAULT_GOAL := app

app_eqc: ERLC_OPTS += -DEQC_TESTING
app_eqc: app

eqc_ci: deps app_eqc
	erlc -o ebin -Iinclude -pa ../../eqc-dev/ci-project/ebin -pa deps/folsom/ebin +"{parse_transform,eqc_cover}" eqc_test/*.erl src/*.erl

# Options.
CT_SUITES = fuse
CT_OPTS = -cover cover.spec
PLT_APPS = sasl


# Dependencies
DEPS = folsom
dep_folsom = https://github.com/boundary/folsom.git


include erlang.mk
