Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NtmFz-0000HG-FD
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 19:21:48 +0100
Received: by gye5 with SMTP id 5so2630910gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=BR2QHcmR/aWMMqEfi8177yTq/60lR6/iq95TBxmYTYM=;
	b=kNBqilnKK2VBNku6zBkkiHPztTYtOhHuWx1ItgSgwEqKcy/jrrFiMuEel9rikgHO2Y
	4YnKYiHsgraIjzQ4oaowgGBfBnZOMOIga72EXq0HSP2eFJF8jvQ1V8HxsW1kHTaDf1LQ
	KMlKf312/+6Ekm4xBNWTlE8GhzJJdS+8yConI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=on2JwQ5DrjSbjPYiVr8GgkuOsIW/iTXNR+VDaxjFEzsj8u5Agg0lQJLXw/SmD2kMjy
	SRhLBFXdSwyJsZ1w8MnMdOsU6mDII2M5lVsd4uewVkvphCj/0qpDoO9zHO+/KEFwyVIA
	nXRCk3T0YwJiQMjVsNh4nRFFiAjlynTwr/oIM=
MIME-Version: 1.0
Received: by 10.91.163.4 with SMTP id q4mr4622298ago.13.1269281914726; Mon, 22 
	Mar 2010 11:18:34 -0700 (PDT)
In-Reply-To: <20100322181143.GB19274@excalibur.local>
References: <openembedded-devel@lists.openembedded.org>
	<1269278693-2935-1-git-send-email-aalonso00@gmail.com>
	<20100322181143.GB19274@excalibur.local>
Date: Mon, 22 Mar 2010 12:18:34 -0600
Message-ID: <d1ded4381003221118g11a4b52dme8d8ce0dfe100bfc@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] u-boot_git.bb: add xilinx ml507 support
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
X-List-Received-Date: Mon, 22 Mar 2010 18:21:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks,

On Mon, Mar 22, 2010 at 12:11 PM, Stefan Schmidt
<stefan@datenfreihafen.org>wrote:

> Hello.
>
> On Mon, 2010-03-22 at 11:24, Adrian Alonso wrote:
> > * Based on xilinx official repos
> > * If a hardware project dir is set in local.conf XILINX_BSP_PATH
> > * it will over write xparameters header and append some canonical
> > * definitions. It also install u-boot elf executable for bare metal
> > * execution, early development stages.
> >
> > Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
>
> Applied and pushed out.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

