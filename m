Return-Path: <purushtm1@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id D54D17452C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 16:05:56 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id u21-v6so24654649lfu.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=9JWuLg2pDrdDr/ONsQ3+PlPmrPjUVvonl1GFG1OShbI=;
	b=Rd2RZ6As66mhx/BTW5T2f/8DdhhhPYWlHMBUtlCgGcLW/5SJ2IxB4hCajv9dhTMo/S
	38FOhR+IRzncP2xAVCA/WiZC1y3Ru71aJ3aeFJmd9Veah2enO5Gur4LWGawPvvvtuBlB
	4Yz6gYVsHbsIld75htGwqb37GXy0ZiaqXuP80u9KHesyKl2q6mxA9ePZPUDNdfsPHkJy
	0tD0SiWdwvsBfeecDlYjyScB3PU7u3dn/m5qXr6cWCRI/DSd6oPyeWBwrYVOFg1MaDQW
	LHKVeFw9sszRvmet3GWHT0NHTZoZPp7n5XyVBPH9DhO92BElzTTsCidwEI5u+0S/MO7z
	za7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=9JWuLg2pDrdDr/ONsQ3+PlPmrPjUVvonl1GFG1OShbI=;
	b=bikyx8gvheRPda8H8PkPO6ItN3SfuHLQ3oI+JApg+Tn0Rd6CdXmo/7JwzeNd7K1tWX
	tXnfC6VCRqWleXimJApUzMEkY8McqAfJSDE4X7iioI9woFV2+Bgl+mSLtIowqB1sf27N
	Yw55GCnKNsFmmcYMg3rkvjBB2iYVeqPszS5diG6nxNXMXTWEDv1K14UHIvxKrKwaWJX3
	UTzvpL2Hs1+lJqIHDx0RhLY8B9A7+XaHiojLfkINYbt5T+2V7A6ygFG9ehE4wB7cXmLj
	tf8SLBN0FhCBtHFPBwqCE/Z93cCZe/7RmB458pqzyb0BnNETsNIFbu3g6Kff78czBUUJ
	xEFA==
X-Gm-Message-State: ALQs6tAscXYVh/+Y8VrjIANavxNv13X9zUE3mlH4AxcuqDtzOlVEnoix
	FQ5qADm56aiPigf4bis8oQxxGrb7SrGnQaKQuCU=
X-Google-Smtp-Source: AB8JxZqcxO1FdHrTsjSW1BeYlmUokOh0lstKWn1HksBV64E3/5Dq2x+H9hrgdP8mklNZdsG9ed10wbBpuyjB7XsRZCk=
X-Received: by 2002:a19:5386:: with SMTP id
	h6-v6mr13087557lfl.45.1524672356108; 
	Wed, 25 Apr 2018 09:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1376.1524669461.1670.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.1376.1524669461.1670.openembedded-devel@lists.openembedded.org>
From: Purushotham <purushtm1@gmail.com>
Date: Wed, 25 Apr 2018 16:05:45 +0000
Message-ID: <CADwT=Zo_hOb1eDPpFGgBN864ZLbSJ9FG8Vv90reT90QX3hicYQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Openembedded-devel Digest, Vol 141, Issue 95
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Apr 2018 16:05:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 25, 2018, 8:47 PM <
openembedded-devel-request@lists.openembedded.org> wrote:

> Send Openembedded-devel mailing list submissions to
>         openembedded-devel@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> or, via email, send a message with subject or body 'help' to
>         openembedded-devel-request@lists.openembedded.org
>
> You can reach the person managing the list at
>         openembedded-devel-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-devel digest..."
>
>
> Today's Topics:
>
>    1. [meta-java][PATCH] libecj-bootstrap-native: simplify build
>       (Andr? Draszik)
>    2. [meta-java][PATCH] classpath: harmonise -native and
>       -initial-native recipes (Andr? Draszik)
>    3. [meta-java][PATCH] docs: add bootstrap-flow.txt (Andr? Draszik)
>    4. [meta-java][PATCH] openjdk-8: update aarch64 version to
>       8u162b12 (Andr? Draszik)
>    5. [meta-java][PATCH] openjdk-8: give downloaded files a more
>       descriptive name (Andr? Draszik)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Wed, 25 Apr 2018 15:59:49 +0100
> From: Andr? Draszik <git@andred.net>
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-java][PATCH] libecj-bootstrap-native: simplify
>         build
> Message-ID: <20180425145949.8524-1-git@andred.net>
> Content-Type: text/plain; charset=UTF-8
>
> From: Andr? Draszik <andre.draszik@jci.com>
>
> Piping 'find' output into multiple files to re-read
> them seems inelegant and is error prone - just use a
> pipe with appropriate options instead.
>
> This avoids potential problems with funny file names,
> and now also makes use of BB_NUMBER_THREADS to speed
> up compilation.
>
> This is a better example to copy from now...
>
> Signed-off-by: Andr? Draszik <andre.draszik@jci.com>
> ---
>  recipes-core/ecj/libecj-bootstrap.inc | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
>
> diff --git a/recipes-core/ecj/libecj-bootstrap.inc
> b/recipes-core/ecj/libecj-bootstrap.inc
> index 9350550..04425f4 100644
> --- a/recipes-core/ecj/libecj-bootstrap.inc
> +++ b/recipes-core/ecj/libecj-bootstrap.inc
> @@ -17,13 +17,8 @@ JAR = "ecj-bootstrap-${PV}.jar"
>
>  do_unpackpost[dirs] = "${B}"
>  do_unpackpost() {
> -  if [ ! -d source ]; then
> -    mkdir source
> -  fi
> -
> -  if [ ! -d build ]; then
> -    mkdir build
> -  fi
> +  mkdir -p source
> +  mkdir -p build
>
>    # Remove crap.
>    rm -f about.html build.xml
> @@ -44,24 +39,18 @@ do_unpackpost() {
>    cp -R source/org build/
>
>    # Remove source code and other stuff.
> -  find build -name '*.java' -exec rm -f {} \;
> -  find build -name '*.html' -exec rm -f {} \;
> +  find build -depth \( -name '*.java' -o -name '*.html' \) -delete
>  }
>
>  addtask unpackpost after do_unpack before do_patch
>
>  do_compile() {
> -  find source -name '*.java' | LC_ALL=C sort > sourcefiles
> -  split -l 25 sourcefiles ecj-sources.
> -
>    # Compiling in place is done because the sources contain
>    # property files which need to be available at runtime.
> -  for list in `find . -name 'ecj-sources.*'`; do
> -      echo "building files in $list ...";
> -      echo jikes-initial -d build -source 1.4 -sourcepath source `cat
> $list`;
> -      jikes-initial \
> -                               -d build -source 1.4 -sourcepath source
> `cat $list`;
> -  done
> +  find source -name '*.java' -print0 \
> +    | LC_ALL=C sort -z \
> +    | xargs -0 -n25 -P ${BB_NUMBER_THREADS} \
> +        jikes-initial -d build -source 1.4 -sourcepath source
>
>    fastjar -c -C build . -f ${JAR}
>  }
> --
> 2.16.2
>
>
>
> ------------------------------
>
> Message: 2
> Date: Wed, 25 Apr 2018 16:02:58 +0100
> From: Andr? Draszik <git@andred.net>
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-java][PATCH] classpath: harmonise -native and
>         -initial-native recipes
> Message-ID: <20180425150258.8606-1-git@andred.net>
> Content-Type: text/plain; charset=UTF-8
>
> From: Andr? Draszik <andre.draszik@jci.com>
>
> removing lots of code-duplication
>
> Signed-off-by: Andr? Draszik <andre.draszik@jci.com>
> ---
>  .../classpath/classpath-initial-native_0.93.bb     | 54
> ++++++++++------------
>  recipes-core/classpath/classpath-native.inc        | 25 +++++-----
>  recipes-core/classpath/classpath-native_0.99.bb    | 31 ++++++-------
>  3 files changed, 51 insertions(+), 59 deletions(-)
>
> diff --git a/recipes-core/classpath/classpath-initial-native_0.93.bb
> b/recipes-core/classpath/classpath-initial-native_0.93.bb
> index 0cfa693..51229ec 100644
> --- a/recipes-core/classpath/classpath-initial-native_0.93.bb
> +++ b/recipes-core/classpath/classpath-initial-native_0.93.bb
> @@ -4,7 +4,6 @@
>  require classpath-native.inc
>
>  DESCRIPTION="Java1.4-compatible GNU Classpath variant that is used as
> bootclasspath for jikes-native."
> -LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
>  DEPENDS += "jikes-native"
>
>  PR = "${INC_PR}.2"
> @@ -13,38 +12,35 @@ SRC_URI += " \
>             file://autotools.patch \
>             file://miscompilation.patch \
>            "
> +SRC_URI[md5sum] = "ffa9e9cac31c5acbf0ea9eff9efa923d"
> +SRC_URI[sha256sum] =
> "df2d093612abd23fe67e9409d89bb2a8e79b1664fe2b2da40e1c8ed693e32945"
>
> -EXTRA_OECONF = " \
> -                --with-jikes=jikes \
> -                --with-fastjar=fastjar \
> -                --with-glibj \
> -                --disable-Werror \
> -                --disable-local-sockets \
> -                --disable-alsa \
> -                --disable-gconf-peer \
> -                --disable-gtk-peer \
> -                --disable-plugin \
> -                --disable-dssi \
> -                --disable-examples \
> -
> --with-glibj-dir=${STAGING_DATADIR_NATIVE}/classpath-initial \
> -
> --with-native-libdir=${STAGING_LIBDIR_NATIVE}/classpath-initial \
> -                --includedir=${STAGING_INCDIR_NATIVE}/classpath-initial \
> -                --with-vm=java \
> -              "
> +EXTRA_OECONF += "\
> +    --with-jikes=jikes \
> +    --with-fastjar=fastjar \
> +    --disable-local-sockets \
> +    --with-glibj-dir=${STAGING_DATADIR_NATIVE}/classpath-initial \
> +    --with-native-libdir=${STAGING_LIBDIR_NATIVE}/classpath-initial \
> +    --includedir=${STAGING_INCDIR_NATIVE}/classpath-initial \
> +    --with-vm=java \
> +"
>
>  # Ensure tools.zip is not installed at same path as classpath-native
>  EXTRA_OEMAKE += "pkgdatadir=${STAGING_DATADIR_NATIVE}/classpath-initial"
>
> -# remove files clashing with classpath-native in sysroot
>  do_install_append() {
> -
> -       for i in gappletviewer gjarsigner gkeytool gjar gnative2ascii
> gserialver grmiregistry gtnameserv gorbd grmid
> -       do
> -               rm ${D}${bindir}/${i}
> -       done
> -       rm ${D}${libdir}/logging.properties
> -       rm ${D}${libdir}/security/classpath.security
> +    # remove files clashing with classpath-native in sysroot
> +    rm \
> +       ${D}${bindir}/gappletviewer \
> +       ${D}${bindir}/gjarsigner \
> +       ${D}${bindir}/gkeytool \
> +       ${D}${bindir}/gjar \
> +       ${D}${bindir}/gnative2ascii \
> +       ${D}${bindir}/gserialver \
> +       ${D}${bindir}/grmiregistry \
> +       ${D}${bindir}/gtnameserv \
> +       ${D}${bindir}/gorbd \
> +       ${D}${bindir}/grmid \
> +       ${D}${libdir}/logging.properties \
> +       ${D}${libdir}/security/classpath.security
>  }
> -SRC_URI[md5sum] = "ffa9e9cac31c5acbf0ea9eff9efa923d"
> -SRC_URI[sha256sum] =
> "df2d093612abd23fe67e9409d89bb2a8e79b1664fe2b2da40e1c8ed693e32945"
> -
> diff --git a/recipes-core/classpath/classpath-native.inc
> b/recipes-core/classpath/classpath-native.inc
> index 6a56337..b1de458 100644
> --- a/recipes-core/classpath/classpath-native.inc
> +++ b/recipes-core/classpath/classpath-native.inc
> @@ -1,6 +1,7 @@
>  SUMMARY = "GNU Classpath standard Java libraries - For native
> Java-dependent programs"
>  HOMEPAGE = "http://www.gnu.org/software/classpath/"
>  LICENSE = "GPL-2.0 & SAX-PD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
>
>  DEPENDS = "fastjar-native zip-native"
>
> @@ -14,17 +15,13 @@ export JAVA="${STAGING_BINDIR_NATIVE}/java-initial"
>  export JAVAC="${STAGING_BINDIR_NATIVE}/ecj-initial"
>  export JAVACFLAGS="-nowarn"
>
> -EXTRA_OECONF = " \
> -                --with-glibj \
> -                --enable-local-sockets \
> -                --disable-Werror \
> -                --disable-alsa \
> -                --disable-gconf-peer \
> -                --disable-gtk-peer \
> -                --disable-plugin \
> -                --disable-dssi \
> -                --disable-gjdoc \
> -                --disable-examples \
> -                --enable-tools \
> -                --includedir=${STAGING_INCDIR}/classpath \
> -               "
> +EXTRA_OECONF = "\
> +    --with-glibj \
> +    --disable-Werror \
> +    --disable-alsa \
> +    --disable-gconf-peer \
> +    --disable-gtk-peer \
> +    --disable-plugin \
> +    --disable-dssi \
> +    --disable-examples \
> +"
> diff --git a/recipes-core/classpath/classpath-native_0.99.bb
> b/recipes-core/classpath/classpath-native_0.99.bb
> index a97cae0..a1e1e0f 100644
> --- a/recipes-core/classpath/classpath-native_0.99.bb
> +++ b/recipes-core/classpath/classpath-native_0.99.bb
> @@ -1,6 +1,5 @@
>  require classpath-native.inc
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
>  DEPENDS += "classpath-initial-native ecj-initial-native
> virtual/java-initial-native"
>
>  PR = "${INC_PR}.0"
> @@ -12,21 +11,21 @@ SRC_URI += " \
>              file://miscompilation.patch \
>              file://toolwrapper-exithook.patch \
>             "
> -
> -# tools using java-initial rather than java sed it out
> -do_compile_append () {
> -
> -       COMMANDS="gappletviewer gjarsigner gkeytool \
> -                  gjar gnative2ascii gserialver grmiregistry \
> -                  gtnameserv gorbd grmid grmic gjavah \
> -                 "
> -
> -        for i in ${COMMANDS};
> -        do
> -                 sed -i -e "s/java-initial/java/g" tools/${i}
> -        done
> -}
> -
>  SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
>  SRC_URI[sha256sum] =
> "f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8"
>
> +EXTRA_OECONF += "\
> +    --enable-local-sockets \
> +    --disable-gjdoc \
> +    --enable-tools \
> +    --includedir=${STAGING_INCDIR}/classpath \
> +"
> +
> +do_compile_append () {
> +    # tools using java-initial rather than java sed it out
> +    cd tools
> +    sed -e "s/java-initial/java/g" \
> +        -i gappletviewer gjarsigner gkeytool \
> +           gjar gnative2ascii gserialver grmiregistry \
> +           gtnameserv gorbd grmid grmic gjavah
> +}
> --
> 2.16.2
>
>
>
> ------------------------------
>
> Message: 3
> Date: Wed, 25 Apr 2018 16:06:46 +0100
> From: Andr? Draszik <git@andred.net>
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-java][PATCH] docs: add bootstrap-flow.txt
> Message-ID: <20180425150646.9032-1-git@andred.net>
> Content-Type: text/plain; charset=UTF-8
>
> From: Andr? Draszik <andre.draszik@jci.com>
>
> Summarises the bootstrap of the java envrionment, rather than having
> to find this described in some wiki page that was copied over from
> OE-classic and never updated.
>
> Signed-off-by: Andr? Draszik <andre.draszik@jci.com>
> ---
>  docs/bootstrap-flow.txt | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 docs/bootstrap-flow.txt
>
> diff --git a/docs/bootstrap-flow.txt b/docs/bootstrap-flow.txt
> new file mode 100644
> index 0000000..602eab7
> --- /dev/null
> +++ b/docs/bootstrap-flow.txt
> @@ -0,0 +1,37 @@
> +* first jikes-native is compiled
> +  * a Java 1.4-capable compiler that does not need a runtime or
> +    (strictly) a class library to work
> +* jikes-initial-native is a wrapper around it
> +
> +* with this compiler we compile the initial (preliminary)
> +  runtime (package virtual/java-initial-native)
> +  * virtual/java-initial-native can be: cacao-initial-native (0.98)
> +    or jamvm-initial-native (1.4.5)
> +    * cacao is preferred, as it has a JIT, but doesn't compile
> +      on all hosts
> +    * cacao-initial-native and jamvm-initial-native both need
> +      classpath-initial-native (0.93) and jikes-initial-native
> +
> +* now libecj-bootstrap-native is built
> +  * this needs jikes-initial-native virtual/java-initial-native
> +* now ecj-initial is built
> +  * this needs libecj-bootstrap-native and
> +    virtual/java-initial-native during runtime
> +  * at that point we have a 1.5-capable compiler (ecj-initial)
> +    running on a Java 1.4 compatible VM (cacao-inital-native
> +    or jamvm-initial-native)
> +
> +* with this compiler (ecj-initial), we compile the final runtime
> +  and compiler (virtual/java-native and virtual/javac-native)
> +  * virtual/java-native can be: cacao-native (1.6.1) or
> +    jamvm-native (2.0.0~pre)
> +    * cacao vs jamvm as above
> +    * cacao-native and jamvm-native both need
> +      classpath-initial-native (0.93) and classpath-native (0.99)
> +      and ecj-initial-native and virtual/java-initial-native
> +  * virtual/javac-native can be: ecj-bootstrap-native
> +    * ecj-bootstrap-native needs libecj-bootstrap-native
> +      and virtual/java-native
> +  * at that point we have a 1.5-capable compiler (ecj-bootstrap-native)
> +    running on a Java 1.5 compatible VN (cacao-native or
> +    jamvm-native)
> --
> 2.16.2
>
>
>
> ------------------------------
>
> Message: 4
> Date: Wed, 25 Apr 2018 16:07:24 +0100
> From: Andr? Draszik <git@andred.net>
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-java][PATCH] openjdk-8: update aarch64 version to
>         8u162b12
> Message-ID: <20180425150724.9102-1-git@andred.net>
> Content-Type: text/plain; charset=UTF-8
>
> From: Andr? Draszik <andre.draszik@jci.com>
>
> Signed-off-by: Andr? Draszik <andre.draszik@jci.com>
> ---
>  recipes-core/openjdk/openjdk-8-release-161b15.inc  | 33
> ----------------------
>  .../openjdk/openjdk-8-release-162b12-aarch64.inc   | 33
> ++++++++++++++++++++++
>  recipes-core/openjdk/openjdk-8_16xbyy.bb           |  5 ++--
>  recipes-core/openjdk/openjre-8_16xbyy.bb           |  5 ++--
>  4 files changed, 39 insertions(+), 37 deletions(-)
>  delete mode 100644 recipes-core/openjdk/openjdk-8-release-161b15.inc
>  create mode 100644
> recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc
>
> diff --git a/recipes-core/openjdk/openjdk-8-release-161b15.inc
> b/recipes-core/openjdk/openjdk-8-release-161b15.inc
> deleted file mode 100644
> index 0a4434c..0000000
> --- a/recipes-core/openjdk/openjdk-8-release-161b15.inc
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -require openjdk-8-release-16xbyy.inc
> -
> -CORBA_CHANGESET_aarch64 = "f73da600c483"
> -SRC_URI[corba.md5sum] = "bf884b82fcc6de466946fcb87d24ebf3"
> -SRC_URI[corba.sha256sum] =
> "ebf73d96185fc05e502088ae89a8d6494c3971dd220458deeff3876f72396b6c"
> -
> -HOTSPOT_CHANGESET_aarch64 = "a600839824fa"
> -SRC_URI[hotspot.md5sum] = "20c88ba26f8f45a2769f4edf32afd593"
> -SRC_URI[hotspot.sha256sum] =
> "6d0d1b9c2df3392ad6e21ca3eae39d06b50632a4a419da3d4363248943ea8b97"
> -
> -JAXP_CHANGESET_aarch64 = "b1e2af899046"
> -SRC_URI[jaxp.md5sum] = "219582b26d7de2973b75f4329b53ec7d"
> -SRC_URI[jaxp.sha256sum] =
> "907cc4dfb01a3a2a6d74dfa90fa6fcb5b3df55600f41ba44dcdc94b47e85a382"
> -
> -JAXWS_CHANGESET_aarch64 = "0002ed323fe5"
> -SRC_URI[jaxws.md5sum] = "44935b81e3405fcaef675d5d08c2149e"
> -SRC_URI[jaxws.sha256sum] =
> "0d1d52f1cf254a643ece1bd6cd8628fae1a4d56e8b59388cc9ad73b3caf151a1"
> -
> -JDK_CHANGESET_aarch64 = "c2ba2ed87d18"
> -SRC_URI[jdk.md5sum] = "f4c0393a157dcb8b90ee7c7d80cbdfbf"
> -SRC_URI[jdk.sha256sum] =
> "c84a17451b47242f9d96bf431011607afc3776f285a6ad9a60190fba2d434c49"
> -
> -LANGTOOLS_CHANGESET_aarch64 = "cdb217c578cb"
> -SRC_URI[langtools.md5sum] = "608cf07781259d916d1663d6a5ced26d"
> -SRC_URI[langtools.sha256sum] =
> "ad28e75bfaba1b64fdd02ea316db3ba3cba68007f90c5fa2be2418ce8bc0074d"
> -
> -NASHORN_CHANGESET_aarch64 = "505d0eb2fafe"
> -SRC_URI[nashorn.md5sum] = "be981a6c55f9e602ff129fed65505a8c"
> -SRC_URI[nashorn.sha256sum] =
> "14419ccd773e1db83b600d05aca3cbac9f24be77abda9a132d12305d8821d6d7"
> -
> -OPENJDK_CHANGESET_aarch64 = "917454da25c1"
> -SRC_URI[openjdk.md5sum] = "1e4b3eca032742b7448731f9b8fcb426"
> -SRC_URI[openjdk.sha256sum] =
> "1e17e2d8384a7b808a89b982e7c09c4feb8598b7a66b93697bfb8759c1005974"
> diff --git a/recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc
> b/recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc
> new file mode 100644
> index 0000000..ed3e957
> --- /dev/null
> +++ b/recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc
> @@ -0,0 +1,33 @@
> +require openjdk-8-release-16xbyy.inc
> +
> +CORBA_CHANGESET_aarch64 = "2c6daa746022"
> +SRC_URI[corba.md5sum] = "2ca2413f1e6eaeb49b1c138c5cafcb30"
> +SRC_URI[corba.sha256sum] =
> "3ffcd358e45b4af5a62d9ac1c8abea2e33a9d25b34096084bc77349d846cf4f4"
> +
> +HOTSPOT_CHANGESET_aarch64 = "b08b1e9e2963"
> +SRC_URI[hotspot.md5sum] = "bb632eba37ad0f54e0535c1e0ae3440c"
> +SRC_URI[hotspot.sha256sum] =
> "fcf8369ff8871dbee81de7a15432b625dd2c6dcfe43d2dd5194d9273de0fdbfc"
> +
> +JAXP_CHANGESET_aarch64 = "413640f7312d"
> +SRC_URI[jaxp.md5sum] = "3232a514db9b7ed2ffbc9ebd69acb4fd"
> +SRC_URI[jaxp.sha256sum] =
> "05ed49cea8559bcbd2ef285c8cfcb0b2026aefb1178ec531f9c72e3918c97a9c"
> +
> +JAXWS_CHANGESET_aarch64 = "8b27752a1bbe"
> +SRC_URI[jaxws.md5sum] = "6688b2d40a0c1d5edff1f5594b6ac7a0"
> +SRC_URI[jaxws.sha256sum] =
> "c818df20d14411af78654cb53cd7f87b1c5b42ed0158775869571a42f75f3c84"
> +
> +JDK_CHANGESET_aarch64 = "9944f808c91d"
> +SRC_URI[jdk.md5sum] = "77b1caebd3d9b89af6ee8d57958334f8"
> +SRC_URI[jdk.sha256sum] =
> "d401a0611c90b52d08424d427cb43e81234dda46645a02d90531dbcbb9976b80"
> +
> +LANGTOOLS_CHANGESET_aarch64 = "7b393a96b373"
> +SRC_URI[langtools.md5sum] = "11e7742f439070bfd697866ad6d1a535"
> +SRC_URI[langtools.sha256sum] =
> "bf85f6e224c4634a9f07eae7dd61786b68803bbf95b0cd022553c80abf457967"
> +
> +NASHORN_CHANGESET_aarch64 = "31efd519fdb3"
> +SRC_URI[nashorn.md5sum] = "47c7267b6e3e3dc30fd18b4d87869c20"
> +SRC_URI[nashorn.sha256sum] =
> "bb8aa4e4d9cf5878dd56528b34002c69d3078adaa4de03e6715d6fd56dbf819d"
> +
> +OPENJDK_CHANGESET_aarch64 = "f8e58f4c29ae"
> +SRC_URI[openjdk.md5sum] = "39cc58bdee52d8997d9674a7b4162935"
> +SRC_URI[openjdk.sha256sum] =
> "66fef9d2abfc8a6769fc6ae552891e984921c55312bf06937b2ce619dc97678f"
> diff --git a/recipes-core/openjdk/openjdk-8_16xbyy.bb
> b/recipes-core/openjdk/openjdk-8_16xbyy.bb
> index dd0ed1d..0802078 100644
> --- a/recipes-core/openjdk/openjdk-8_16xbyy.bb
> +++ b/recipes-core/openjdk/openjdk-8_16xbyy.bb
> @@ -1,7 +1,8 @@
>  PV = "162b12"
> -PV_aarch64 = "161b15"
>
> -require openjdk-8-release-${PV}.inc
> +INC_FILE_SUFFIX = ""
> +INC_FILE_SUFFIX_aarch64 = "-aarch64"
> +require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
>  require openjdk-8-cross.inc
>
>  do_install() {
> diff --git a/recipes-core/openjdk/openjre-8_16xbyy.bb
> b/recipes-core/openjdk/openjre-8_16xbyy.bb
> index e6454ea..ab78339 100644
> --- a/recipes-core/openjdk/openjre-8_16xbyy.bb
> +++ b/recipes-core/openjdk/openjre-8_16xbyy.bb
> @@ -1,7 +1,8 @@
>  PV = "162b12"
> -PV_aarch64 = "161b15"
>
> -require openjdk-8-release-${PV}.inc
> +INC_FILE_SUFFIX = ""
> +INC_FILE_SUFFIX_aarch64 = "-aarch64"
> +require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
>  require openjdk-8-cross.inc
>
>  do_install() {
> --
> 2.16.2
>
>
>
> ------------------------------
>
> Message: 5
> Date: Wed, 25 Apr 2018 16:17:35 +0100
> From: Andr? Draszik <git@andred.net>
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-java][PATCH] openjdk-8: give downloaded files a
>         more    descriptive name
> Message-ID: <20180425151735.9983-1-git@andred.net>
> Content-Type: text/plain; charset=UTF-8
>
> From: Andr? Draszik <andre.draszik@jci.com>
>
> Rather than using the HG (mercurial) changeset IDs directly,
> add a more descriptive part to the file name. This can help
> with download cache management.
>
> Signed-off-by: Andr? Draszik <andre.draszik@jci.com>
> ---
>  recipes-core/openjdk/openjdk-8-common.inc         | 14 ++++++-------
>  recipes-core/openjdk/openjdk-8-release-16xbyy.inc | 24
> +++++++++++++++--------
>  2 files changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc
> b/recipes-core/openjdk/openjdk-8-common.inc
> index d8b38f5..2c68462 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -30,13 +30,13 @@ SRC_URI = " \
>  do_unpack_extract_submodules () {
>      cd "${S}"
>      # tar --transform
> -    tar xjf ${WORKDIR}/${CORBA_FILE} --transform
> "s,-${CORBA_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${HOTSPOT_FILE} --transform
> "s,-${HOTSPOT_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${JAXP_FILE} --transform "s,-${JAXP_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${JAXWS_FILE} --transform
> "s,-${JAXWS_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${JDK_FILE} --transform "s,-${JDK_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${LANGTOOLS_FILE} --transform
> "s,-${LANGTOOLS_CHANGESET},,g"
> -    tar xjf ${WORKDIR}/${NASHORN_FILE} --transform
> "s,-${NASHORN_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${CORBA_FILE_LOCAL} --transform
> "s,-${CORBA_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${HOTSPOT_FILE_LOCAL} --transform
> "s,-${HOTSPOT_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${JAXP_FILE_LOCAL} --transform
> "s,-${JAXP_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${JAXWS_FILE_LOCAL} --transform
> "s,-${JAXWS_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${JDK_FILE_LOCAL} --transform
> "s,-${JDK_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${LANGTOOLS_FILE_LOCAL} --transform
> "s,-${LANGTOOLS_CHANGESET},,g"
> +    tar xjf ${WORKDIR}/${NASHORN_FILE_LOCAL} --transform
> "s,-${NASHORN_CHANGESET},,g"
>  }
>
>  do_unpack_remove_X11_wrappers() {
> diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> index bd4a349..c1fcda4 100644
> --- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
> @@ -64,25 +64,33 @@ OPENJDK_HG_U = "jdk8u"
>  OPENJDK_HG_URL = "
> http://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}"
>
>  OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
> -OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=openjdk"
> +OPENJDK_FILE_LOCAL = "openjdk8-${PV}-jdk8u-${OPENJDK_FILE}"
> +OPENJDK_URI =
> "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};downloadfilename=${OPENJDK_FILE_LOCAL};name=openjdk"
>
>  HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
> -HOTSPOT_URI =
> "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
> +HOTSPOT_FILE_LOCAL = "openjdk8-${PV}-hotspot-${HOTSPOT_FILE}"
> +HOTSPOT_URI =
> "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};downloadfilename=${HOTSPOT_FILE_LOCAL};name=hotspot;unpack=false"
>
>  CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
> -CORBA_URI =
> "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
> +CORBA_FILE_LOCAL = "openjdk8-${PV}-corba-${CORBA_FILE}"
> +CORBA_URI =
> "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};downloadfilename=${CORBA_FILE_LOCAL};name=corba;unpack=false"
>
>  JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
> -JAXP_URI =
> "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
> +JAXP_FILE_LOCAL = "openjdk8-${PV}-jaxp-${JAXP_FILE}"
> +JAXP_URI =
> "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};downloadfilename=${JAXP_FILE_LOCAL};name=jaxp;unpack=false"
>
>  JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
> -JAXWS_URI =
> "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
> +JAXWS_FILE_LOCAL = "openjdk8-${PV}-jaxws-${JAXWS_FILE}"
> +JAXWS_URI =
> "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};downloadfilename=${JAXWS_FILE_LOCAL};name=jaxws;unpack=false"
>
>  JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
> -JDK_URI =
> "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
> +JDK_FILE_LOCAL = "openjdk8-${PV}-jdk-${JDK_FILE}"
> +JDK_URI =
> "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};downloadfilename=${JDK_FILE_LOCAL};name=jdk;unpack=false"
>
>  LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
> -LANGTOOLS_URI =
> "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
> +LANGTOOLS_FILE_LOCAL = "openjdk8-${PV}-langtools-${LANGTOOLS_FILE}"
> +LANGTOOLS_URI =
> "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};downloadfilename=${LANGTOOLS_FILE_LOCAL};name=langtools;unpack=false"
>
>  NASHORN_FILE = "${NASHORN_CHANGESET}.tar.bz2"
> -NASHORN_URI =
> "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};name=nashorn;unpack=false"
> +NASHORN_FILE_LOCAL = "openjdk8-${PV}-nashorn-${NASHORN_FILE}"
> +NASHORN_URI =
> "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};downloadfilename=${NASHORN_FILE_LOCAL};name=nashorn;unpack=false"
> --
> 2.16.2
>
>
>
> ------------------------------
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> End of Openembedded-devel Digest, Vol 141, Issue 95
> ***************************************************
>

