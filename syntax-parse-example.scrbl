#lang scribble/manual
@require[
  (for-label
    racket/base
    scribble/manual
    syntax/parse
    syntax-parse-example/first-class-or/first-class-or)
]
@(define GITHUB-URL "https://github.com/bennn/syntax-parse-example")

@title{Syntax Parse Examples}
Source code: @url[GITHUB-URL]

@defmodulelang[syntax-parse-example]{
  This package is a collection of useful and/or illustrative macros written
  using the @racketmodname[syntax/parse] library.

  @Secref{sec:reference} documents the @racketmodname[syntax-parse-example] language.
}


@; =============================================================================
@section{How to browse the examples}

Two options:
@itemlist[
@item{
  Scroll through this document, read the macros' source code and look at the
  example uses of each macro.
}
@item{@(let ([example-macro-name @tt{big-mac}]) @list{
  The source code for each macro is in a top-level folder at @url[GITHUB-URL].
  For example, the source for a macro named @|example-macro-name| would be in a
  folder named @|example-macro-name| at @url[GITHUB-URL].
})}
]


@section{How to use the examples in another project}

Three options, ordered from best to worst.
@itemlist[
@item{
  Copy/paste the example code into a new file in your project, require that
  new file normally.
}
@item{@(let ([example-macro-name @tt{first-class-or}]
             [example-macro-modname @filepath{syntax-parse-example/first-class-or/first-class-or}]) @list{
  Install the @racketmodname[syntax-parse-example] package, then require
  the macro's defining module.
  For example, the defining module for the @|example-macro-name| macro is
  @|example-macro-modname|.
})}
@item{
  Clone the @hyperlink[GITHUB-URL]{source code}, then require the
  module path of the file that defines the macro.
}
]


@section{How to contribute a new example}
@(let ([example-macro-name "EUGENE"]) @list{

To create an example named @tt[example-macro-name]:
@itemlist[
@item{
  Clone this repository (@hyperlink[GITHUB-URL]{link}).
}
@item{
  Run @exec{raco syntax-parse-example --new @|example-macro-name|} in the
  top-level folder of the cloned repository.
  This generates three new files:
  @itemlist[
  @item{
    @tt{@|example-macro-name|/@|example-macro-name|.rkt} (source code)
  }
  @item{
    @tt{@|example-macro-name|/@|example-macro-name|-test.rkt} (tests)
  }
  @item{
    @tt{@|example-macro-name|/@|example-macro-name|-doc.scrbl} (Scribble documentation)
  }
  ]
}
@item{
  Fill the holes in the newly-generated files with an implementation,
   some unit tests,
   and documentation.
}
@item{
  Run @exec{raco setup syntax-parse-example} to generate the documentation.
}
]

})

@; =============================================================================
@include-section{index.scrbl}
@; =============================================================================

@section[#:tag "sec:reference"]{Reference}

The @racketmodname[syntax-parse-example] language is a small language for
 documenting example macros. It:
@itemlist[
@item{
  uses the reader from @racketmodname[scribble/base]; and
}
@item{
  provides a few utility functions, documented below.
}
]

@defmodule[syntax-parse-example/render]{
  Helpers for rendering documentation.
}

@defproc[(tech/guide [pre-content pre-content?] ...) element?]{
  Similar to @racket[tech], but links to @other-manual['(lib "scribblings/guide/guide.scrbl")].
}

@defproc[(tech/reference [pre-content pre-content?] ...) element?]{
  Similar to @racket[tech], but links to @other-manual['(lib "scribblings/reference/reference.scrbl")].
}

@defproc[(racketfile [filename path-string?]) element?]{
  Typesets the contents of the given file as if its contents were wrapped in a @racket[racketblock].
}
