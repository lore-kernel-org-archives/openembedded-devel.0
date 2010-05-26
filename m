Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OHHqJ-0005mt-BV
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 16:44:42 +0200
Received: from p5b035a88.dip.t-dialin.net ([91.3.90.136] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OHHmI-0007AQ-Pn by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 16:40:17 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OHAQy-0007Rl-N7
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:49:44 +0200
Date: Wed, 26 May 2010 08:49:44 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526064944.GK22917@excalibur.local>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
	<1274854676-5931-7-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1274854676-5931-7-git-send-email-koen@openembedded.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_06_12,SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 7/7] Usermanual/usage: Fix documentation errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 May 2010 14:44:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 2010-05-26 at 08:17, Koen Kooi wrote:
> From: Chase Maupin <chase.maupin@ti.com>
> 
> * Fixed up typos and other errors in the documentation.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Koen Kooi <k-kooi@ti.com>

Non-native speaker ack:
Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

> ---
>  docs/usermanual/chapters/usage.xml |   64 ++++++++++++++++++------------------
>  1 files changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/docs/usermanual/chapters/usage.xml b/docs/usermanual/chapters/usage.xml
> index 1563dc3..9197ffa 100644
> --- a/docs/usermanual/chapters/usage.xml
> +++ b/docs/usermanual/chapters/usage.xml
> @@ -5,15 +5,15 @@
>    <section id="usage_introduction" xreflabel="introduction">
>      <title>Introduction</title>
>  
> -    <para>If you're reading this manual you probably already have some idea of
> +    <para>If you are reading this manual you probably already have some idea of
>      what OpenEmbedded is all about, which is taking a lot of software and
>      creating something that you can run on another device. This involves
>      downloading some source code, compiling it, creating packages (like .deb
> -    or .rpm) and/or creating boot images that can written to flash on the
> +    or .rpm) and/or creating boot images that can be written to flash on the
>      device. The difficulties of cross-compiling and the variety of devices
>      which can be supported lead to a lot more complexity in an OpenEmbedded
>      based distribution than you'd find in a typical desktop distribution
> -    (for which cross-compiling isn't needed).</para>
> +    (where cross-compiling isn't needed).</para>
>  
>      <para>A major part of OpenEmbedded deals with compiling source code for
>      various projects. For each project this generally requires the same basic
> @@ -67,7 +67,7 @@
>        <listitem>
>          <para>Tool chains (compiler, linker etc) are often difficult to
>          compile. Cross tool chains are even more difficult. Typically you'd go
> -        out and download a tool chain made by someone else - but not when your
> +        out and download a tool chain made by someone else - but not when you're
>          using OE. In OE the entire toolchain is built as part of the process.
>          This may make things take longer initially and may make it more
>          difficult to get started but makes it easier to apply patches and test
> @@ -123,7 +123,7 @@
>      helping you understand how to debug and develop within
>      OpenEmbedded.</para>
>  
> -    <para>You'll also not a lot of reference to variables that define specific
> +    <para>You'll also note a lot of references to variables that define specific
>      directories or change the behaviour of some part of the build process. You
>      should refer to <xref linkend="chapter_recipes" /> for full details on
>      these variables.</para>
> @@ -160,7 +160,7 @@
>          <listitem>
>            <para>This directory contains distribution related files. A
>            distribution decides how various activities are handled in the final
> -          image, such as how networking configured, if usb devices will be
> +          image, such as how networking is configured, if usb devices will be
>            supported, what packaging system is used, which libc is used
>            etc.</para>
>          </listitem>
> @@ -194,7 +194,7 @@
>      <title>Work space</title>
>  
>      <para>Let's start out by taking a look at a typically working area. Note
> -    that this may not be exactly what see - there are a lot of options that
> +    that this may not be exactly what you see - there are a lot of options that
>      can effect exactly how things are done, but it gives us a pretty good idea
>      of whats going on. What we are looking at here is the tmp directory (as
>      specified by TMPDIR in your local.conf):<screen>$ <command>find</command> tmp -maxdepth 2 -type d 
> @@ -303,10 +303,10 @@ tmp/deploy/images</screen></para>
>        </varlistentry>
>  
>        <varlistentry>
> -        <term>staging</term>
> +        <term>sysroots</term>
>  
>          <listitem>
> -          <para>Contains the staging area, which is used to stored natively
> +          <para>Contains the staging area, which is used to store natively
>            compiled tools and and libraries and headers for the target that are
>            required for building other software.</para>
>          </listitem>
> @@ -324,9 +324,9 @@ tmp/deploy/images</screen></para>
>      </variablelist>
>  
>      <para>When people refer to the <emphasis>"tmp directory"</emphasis> this
> -    is the directory them are talking about.</para>
> +    is the directory they are talking about.</para>
>  
> -    <para>To perform a complete rebuild from script you would usually rename
> +    <para>To perform a complete rebuild from scratch you would usually rename
>      or delete tmp and then restart your build. I recommend keeping one old
>      version of tmp around to use for comparison if something goes wrong with
>      your new build. For example:<screen>$ <command>rm</command> -fr tmp.OLD
> @@ -339,7 +339,7 @@ $ <command>bitbake</command> bootstrap-image</screen></para>
>        <para>The work directory is where all source code is unpacked into,
>        where source is configured, compiled and packaged. In other words this
>        is where all the action happens. Each bitbake recipe will produce a
> -      corresponding sub directory in the work directory. The sub directory
> +      corresponding subdirectory in the work directory. The subdirectory
>        name will contain the recipe name, version and the release number (as
>        defined by the PR variable within the recipe).</para>
>  
> @@ -348,9 +348,9 @@ $ <command>bitbake</command> bootstrap-image</screen></para>
>  tmp/work
>  tmp/work/busybox-1.2.1-r13
>  tmp/work/libice-1_1.0.3-r0
> -tmp/work/arpwatch-2.1a15-r2</screen>You can see that the first three (of
> +tmp/work/arpwatch-2.1a15-r2</screen>You can see the first three (of
>        several hundred) recipes here and they are for release 13 of busybox
> -      1.2.1, release 0 or libice 1.1.0.3 and release 2 of arpwatch 2.1a15.
> +      1.2.1, release 0 of libice 1.1.0.3 and release 2 of arpwatch 2.1a15.
>        It's also possible that you may just have a sub directory for your
>        targets architecture and operating system in which case these
>        directories will be in that additional subdirectory, as shown
> @@ -446,7 +446,7 @@ tmp/work/lzo-1.08-r14/image</screen></para>
>              install into <emphasis role="bold">${D}/usr/bin</emphasis> and
>              <emphasis role="bold">${D}/usr/lib</emphasis> instead. When
>              installed on the target the ${D} will be not be included so
> -            they'll end up in the correct place. You definitely don't wont
> +            they'll end up in the correct place. You definitely don't want
>              files on your host system being replaced by cross-compiled
>              binaries for your target!</para>
>            </listitem>
> @@ -544,14 +544,14 @@ tmp/work/lzo-1.08-r14/install/lzo/usr/lib/liblzo.so.1.0.0</screen></para>
>      packages. You probably need to start out by downloading the source code,
>      then unpacking the source code. Maybe you need to apply some patches for
>      some reason. Then you might run the configure script of the package,
> -    perhaps passing it some options to configure it to your liking. The you
> -    might run "make install" to install the software. If your actually going
> +    perhaps passing it some options to configure it to your liking. Then you
> +    might run "make install" to install the software. If you're actually going
>      to make some packages, such as .deb or .rpm, then you'd have additional
>      tasks you'd perform to make them.</para>
>  
>      <para>You find that building things in OpenEmbedded works in a similar way
>      - there are a number of tasks that are executed in a predefined order for
> -    each recipe. Any many of the tasks correspond to those listed above like
> +    each recipe. Many of the tasks correspond to those listed above like
>      <emphasis>"download the source"</emphasis>. In fact you've probably
>      already seen some of the names of these tasks - bitbake displays them as
>      they are processed:<screen>$ <command>bitbake</command> lzo
> @@ -718,7 +718,7 @@ NOTE: build 200705041709: completed</screen><note>
>            <para>The <emphasis>configure</emphasis> task takes care of the
>            configuration of the package. Running a configure script
>            (<emphasis>"./configure &lt;options&gt;"</emphasis>) is probably the
> -          form of configuration that is most recognised but it's not the only
> +          form of configuration that is most recognized but it's not the only
>            configuration system that exists.</para>
>          </listitem>
>        </varlistentry>
> @@ -748,7 +748,7 @@ NOTE: build 200705041709: completed</screen><note>
>              <para>This is different from the <emphasis>install</emphasis> task
>              in that this is responsible for making available libraries and
>              headers for use during build on the development host. Therefore
> -            it's libraries which normal have to stage things while
> +            it is libraries which normally have to stage things while
>              applications normally don't need to. The
>              <emphasis>install</emphasis> task on the other hand is making
>              files available for packaging and ultimately installation on the
> @@ -762,7 +762,7 @@ NOTE: build 200705041709: completed</screen><note>
>  
>          <listitem>
>            <para>The <emphasis>install</emphasis> task is responsible for
> -          actually installing everything. Now this needs to install the
> +          actually installing everything. This needs to install the
>            software into the destination directory, <emphasis
>            role="bold">D</emphasis>. This directory won't actually be a part of
>            the final package though. In other words if you install something
> @@ -782,7 +782,7 @@ NOTE: build 200705041709: completed</screen><note>
>            package. It moves the files for the destination directory, <emphasis
>            role="bold">${D}</emphasis>, that they were installed in into the
>            appropriate packages subdirectory. Usually there will be a main
> -          package a separate documentation (-doc), development (-dev) and
> +          package, a separate documentation (-doc), development (-dev) and
>            debugging packages (-dbg) for example.</para>
>          </listitem>
>        </varlistentry>
> @@ -808,11 +808,11 @@ NOTE: build 200705041709: completed</screen><note>
>        <emphasis>install</emphasis>. This is slightly confusing but any task
>        <emphasis>x</emphasis> is implemented via a function called
>        <emphasis>do_x</emphasis> in the class or recipe where it is defined.
> -      See places refer to the tasks via their name only and some with the
> +      Some places refer to the tasks via their name only and some with the
>        <emphasis>do</emphasis> prefix.</para>
>      </note>
>  
> -    <para>You will almost certainly notice tasks beyond these ones - there are
> +    <para>You will almost certainly notice tasks beyond the ones above - there are
>      various methods available to insert additional tasks into the tasks
>      sequence. As an example the <emphasis
>      role="bold">insane.bbclass</emphasis>, which performs various QA checks,
> @@ -822,7 +822,7 @@ NOTE: build 200705041709: completed</screen><note>
>      another new task called <emphasis>qa_staging</emphasis> between
>      <emphasis>populate_sysroot</emphasis> and <emphasis>build</emphasis>
>      tasks. The former validates the result of the
> -    <emphasis>configure</emphasis> task and the late the results of the
> +    <emphasis>configure</emphasis> task and the later the results of the
>      <emphasis>populate_sysroot</emphasis> task.</para>
>  
>      <para>To determine the full list of tasks available for a specific recipe
> @@ -943,8 +943,8 @@ $ <command>bitbake</command> -b &lt;bb-file&gt; -D</screen></para>
>          <listitem>
>            <para>Unpack the source file but don't apply the patches yet.
>            Sometimes you may want to look at the extracted, but not patched
> -          source code and that's what just unpacking will give you (some
> -          time's handy to get diffs generated against the original
> +          source code and that's what just unpacking will give you 
> +          (sometimes handy to get diffs generated against the original
>            source).</para>
>          </listitem>
>        </varlistentry>
> @@ -961,7 +961,7 @@ $ <command>bitbake</command> -b &lt;bb-file&gt; -D</screen></para>
>          <term>configure</term>
>  
>          <listitem>
> -          <para>Performs and configuration that is required for the
> +          <para>Performs any configuration that is required for the
>            software.</para>
>          </listitem>
>        </varlistentry>
> @@ -1013,12 +1013,12 @@ $ <command>bitbake</command> -b &lt;bb-file&gt; -D</screen></para>
>        </varlistentry>
>      </variablelist>
>  
> -    <para>Note that each of the actions that corresponds to task's will run
> +    <para>Note that each of the actions that corresponds to a task will run
>      any preceding tasks that have not yet been performed. So starting with
>      compile will also perform the fetch, unpack, patch and configure
>      actions.</para>
>  
> -    <para>A typically development session might involve editing files in the
> +    <para>A typical development session might involve editing files in the
>      working directory and then recompiling until it all works:<screen>[<emphasis>... test ...</emphasis>]
>  $ <command>bitbake</command> -b recipes/testapp/testapp_4.3.bb -c compile -D
>  
> @@ -1072,7 +1072,7 @@ $ <command>vi</command> recipes/testapp/testapp_4.3.bb</screen>At this stage you
>      build a specific recipe:<screen>BB&gt;&gt; build net-snmp</screen>If it
>      fails you may want to clean the build before trying again:<screen>BB&gt;&gt; clean net-snmp</screen>If
>      you update the recipe by editing the .bb file (to fix some issues) then
> -    you will want to clean the package, reparse the modified recipe, and the
> +    you will want to clean the package, reparse the modified recipe, and then
>      build again:<screen>BB&gt;&gt; clean net-snmp
>  BB&gt;&gt; reparse net-snmp
>  BB&gt;&gt; build net-snmp</screen>Note that you can use wildcards in the
> @@ -1088,7 +1088,7 @@ BB&gt;&gt; build net-snmp</screen>Note that you can use wildcards in the
>      various environment variables, such as <emphasis role="bold">CC</emphasis>
>      and <emphasis role="bold">PATH</emphasis> etc, to values suitable for
>      cross-compiling. If you wish to manually run configure scripts and compile
> -    file during development it would be nice to have all those values set for
> +    files during development it would be nice to have all those values set for
>      you. This is what devshell does - it provides you with an interactive
>      shell with all the appropriate variables set for cross-compiling.</para>
>  
> -- 
> 1.7.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


