PROJECT = fuse

.DEFAULT_GOAL := app

app_eqc: ERLC_OPTS += -DEQC_TESTING
app_eqc: app

eqc_ci: deps app_eqc
	erlc -o ebin -Iinclude -pa deps/folsom/ebin eqc_test/*.erl

# Options.
CT_SUITES = fuse
CT_OPTS = -cover cover.spec
PLT_APPS = sasl


# Dependencies
DEPS = folsom
dep_folsom = https://github.com/boundary/folsom.git


include erlang.mk
