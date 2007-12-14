Received: from [209.85.198.185] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <raj.khem@gmail.com>) id 1J3FXw-0007X7-CZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2007 19:46:04 +0100
Received: by rv-out-0910.google.com with SMTP id c24so992892rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 10:41:31 -0800 (PST)
Received: by 10.140.192.9 with SMTP id p9mr1111619rvf.168.1197657691129;
	Fri, 14 Dec 2007 10:41:31 -0800 (PST)
Received: by 10.141.172.11 with HTTP; Fri, 14 Dec 2007 10:41:30 -0800 (PST)
Message-ID: <19c1b8a90712141041x2faa207emd29f8a696a0a2253@mail.gmail.com>
Date: Fri, 14 Dec 2007 10:41:30 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4762AFA6.6040109@balister.org>
MIME-Version: 1.0
References: <4762095D.4060505@protium.com> <4762AFA6.6040109@balister.org>
Subject: Re: RFC: Renaming uboot-utils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2007 18:46:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

yes it is a logical step. Go for it

Khem

On Dec 14, 2007 8:30 AM, Philip Balister <philip@balister.org> wrote:
> +1
>
> Philip
>
>
> Andy Wilcox wrote:
> > Since uboot-utils builds a native binary (mkImage) it should really be
> > called
> > uboot-utils-native.
> >
> > My motivation is (a) I'd really like to build a few tools from uboot
> > which are cross-compiled (notably, fw-setenv/printenv, which allow R/W
> > access to the u-boot configuration space), and (b) it's the "right"
> > thing to do (-;
> >
> > The following files would be updated:
> >
> > ./conf/distro/foonas.conf
> > ./conf/distro/include/angstrom-2007-preferred-versions.inc
> > ./packages/linux/em-x270_2.6.23.bb
> > ./packages/linux/linux-bd-neon-2.6_2.6.22.bb
> > ./packages/linux/linux-gumstix_2.6.15.bb
> > ./packages/linux/linux-omap.inc
> > ./packages/linux/linux-storcenter_2.6.12.6.bb
> > ./packages/linux/linux-turbostation_2.6.20.2.bb
> > ./packages/tasks/task-base.bb
> >
> > Any objection or comment?
> >
> > Thanks!
> > Andy
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


