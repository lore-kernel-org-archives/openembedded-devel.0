Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ozpsl-0007xU-H9
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 13:59:05 +0200
Received: by iwn2 with SMTP id 2so2025610iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 04:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oZRWZfMgKhznBDsysQFodMZuL+0tQDRbzoE9hVsXOL8=;
	b=S3SSPJsGMwvhvRe4Gphq9MYkhUF2ok74w/uI0hcOPmAt/Q2/TEJQxBxIYjQkok46HJ
	briQMCaaE3G7JM0PfL0ShQEG1jJmgUPi2wqpVfQckud/Ylirg+OOVjLAJ4QuMhp5q8Qb
	8c/VcXhlVuOnETtCAiVNu3jRBClxH2ysI413s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=leczjpfiWrTn+unylL2rNBWjZDsLbMH+e+QQPtDbJN8Yam+0UY/KVMiiqi0GNYqFhB
	GIgvXsEDpaYvEFYaS0Ug8r8nykuQMbitbYKV5D5oBbz+V/B563DkLxHqmSf5dJgHPHG3
	Z1Yren1/0UzPqVq53f7uv8V6JgUrYnPDDqeY4=
MIME-Version: 1.0
Received: by 10.231.148.20 with SMTP id n20mr7118964ibv.196.1285502332003;
	Sun, 26 Sep 2010 04:58:52 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 26 Sep 2010 04:58:51 -0700 (PDT)
In-Reply-To: <4C9F2ACC.9090308@freyther.de>
References: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>
	<4C9F2ACC.9090308@freyther.de>
Date: Sun, 26 Sep 2010 13:58:51 +0200
Message-ID: <AANLkTin6F1_L_Zx_qZt=ujY-tUFB+FSfT4hR+GsWGnYs@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some more non fetching recipes
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
X-List-Received-Date: Sun, 26 Sep 2010 11:59:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/26 Holger Freyther <holger+oe@freyther.de>:
> On 09/26/2010 06:21 PM, Frans Meulenbroeks wrote:
>
>> dpkg/dpkg-native_1.14.29.bb
>> dpkg/dpkg_1.14.29.bb
>
> fetct the rev from archive, or better upgrade..

if it is available somewhre else I can fetch from elsewhere,
upgrade is too much work for a recipe that I do not use and have no
idea on how to test
>
>
>
>
>> openmoko-projects/paroli_git.bb
>> openmoko-projects/tichy_git.bb
>> openmoko2/openmoko-alsa-scenarios_svn.bb
>> openmoko2/openmoko-contacts2_svn.bb
>> openmoko2/openmoko-dates2_svn.bb
>> openmoko2/openmoko-tasks2_svn.bb
>
> oh, the servers should still be running.

What do you mean to say with that?
>
>
>
>> powervr-drivers/bc-cube_0.1.0.bb
>> powervr-drivers/bc-cube_0.2.0.bb
>> powervr-drivers/libgles-omap3_3.01.00.02.bb
>> powervr-drivers/libgles-omap3_3.01.00.06.bb
>> powervr-drivers/libgles-omap3_3.01.00.07.bb
>> powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
>> powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
>> qt4/qt4-embedded-gles_4.6.0.bb
>> qt4/qt4-embedded-gles_4.6.2.bb
>> qt4/qt4-embedded-gles_4.6.3.bb
>> qt4/qt4-x11-free-gles_4.5.2.bb
>> qt4/qt4-x11-free-gles_4.6.0.bb
>> qt4/qt4-x11-free-gles_4.6.2.bb
>> qt4/qt4-x11-free-gles_4.6.3.bb
>> qt4/qt4-x11-free-gles_4.7.0.bb
>
> I assume these require the powervr manual download?

The first ones maybe, the qt ones seem to refer to files that are not
on the trolltech site any more. Then again the non-gles version
fetches.
I've just give it a short try and I guess this is recipe or bitbake related:

frans@linux-suse:~/oe/openembedded/recipes/qt4> bitbake -cclean -b
qt4-x11-free-gles_4.6.3.bb
ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 174, in buildFile
    command.cooker.buildFile(bfile, task)
  File "/home/frans/oe/bitbake/lib/bb/cooker.py", line 650, in buildFile
    self.status.task_deps[fn]['depends'] = {}
TypeError: 'NoneType' object does not support item assignment

Frans

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


