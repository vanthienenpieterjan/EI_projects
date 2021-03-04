EXE     = rootscript
SRCDIRS = . src 
INCDIRS = . include /usr/include/root
LIBS    = -L/usr/lib64/root -lCore -lCint -lTree -lMatrix -lm -ldl -lHist -lGraf -lGui -lGraf3d -lGpad

CC      = g++
LFLAGS  = -s
LDFLAGS=`root-config --glibs`
CFLAGS  = -c -g -Wall `root-config --cflags`

SRC     = $(foreach dir,$(SRCDIRS),$(wildcard $(dir)/*.cc))
OBJ     = $(addprefix tmp/, $(SRC:.cc=.o))
DEP     = $(addprefix tmp/,$(SRC:.cc=.d))
INCLUDE = $(addprefix -I, $(INCDIRS) )

.PHONY: clean dirs

$(EXE): dirs $(OBJ) 
	@echo;echo linking $(EXE)
	@$(CC) -o $(EXE) $(OBJ) $(LFLAGS) $(LDFLAGS)

tmp/%.o: %.cc
	@echo;echo  creating object file for $*
	@$(CC) -Wp,-MMD,tmp/$*.dd $(CFLAGS) $(INCLUDE) -c $< -o $@
	@sed -e '1s/^/$(subst /,\/,$(dir $@))/' tmp/$*.dd > $*_tmp; mv $*_tmp tmp/$*.d
	@rm -f tmp/$*.dd


%.hh: ;
		

clean:
	@echo clean!
	@-rm -r tmp

dirs:
	@-if [ ! -e tmp ]; then mkdir tmp; fi;
	@-$(foreach DIR,$(SRCDIRS), if [ ! -e tmp/$(DIR) ]; then mkdir tmp/$(DIR); fi; )

-include $(DEP)
