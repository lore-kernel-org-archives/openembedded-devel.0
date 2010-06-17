Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OPKZt-00069o-Ah
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 21:17:20 +0200
Received: by iwn5 with SMTP id 5so197203iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 12:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=SdeJdTrPlMNAfI5FK5/9SKcPg/G3nf1ROI68pkPI45E=;
	b=AzqVblFA4s44OkQqoIWg+hWBziTOrdTI2Wwm8v60SJuVb969Fx7tzMKk/gVlohyO4D
	DgBqrAC3je17KRDlZwb6YVxd69XJCl0NYlOR9UvDEQSe1DF3p4qPjswj/Eew36+wl9bL
	vmCgN2NYwfbHGCoPU8GSChc/TS+/t3IXifgdw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=rse0uY/+2oZQvhsn2w1i2LEluKh17FpyNPq5PL8JYyUvHMZyisPYEiDVnvbJUV5SGC
	eznwFWMc3+uJ1b62c1nF5U3fPQrOEy0dekfV4D37mReUXoHZvH0O2wD1kkoBhDzEAH6r
	UTLf6e9bRU57xqHrBHYUBesaqjbFY9OxEsgt8=
Received: by 10.231.124.5 with SMTP id s5mr11777583ibr.195.1276801932166; Thu, 
	17 Jun 2010 12:12:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Thu, 17 Jun 2010 12:11:52 -0700 (PDT)
In-Reply-To: <AANLkTilzhsHsHj4f-bd4FcB7Ka7fRspYX0iUsMxxzVuz@mail.gmail.com>
References: <AANLkTilQUwinqS2HGJJzP3t_UTmXtH9daLEiN_fek-6i@mail.gmail.com> 
	<AANLkTikBqtzPB0rBp1DQ4Ekzo40HeAJcX1q7i1mLFaWy@mail.gmail.com> 
	<AANLkTim1FUHwT6lBvu2yoUUM8rvYRSaw-9e4VE_olNoa@mail.gmail.com> 
	<AANLkTilzhsHsHj4f-bd4FcB7Ka7fRspYX0iUsMxxzVuz@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jun 2010 12:11:52 -0700
Message-ID: <AANLkTikK720KNmNjRKr6x12-kSben4t42KlmgHsSGEpS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OSError: [Errno 2] No such file or directory
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
X-List-Received-Date: Thu, 17 Jun 2010 19:17:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 17, 2010 at 5:39 AM, nikunj badjatya
<nikunjbadjatya@gmail.com> wrote:
> /home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
> do_populate_sysroot)
> NOTE: Testing
> /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
> for relocatability
> ERROR: Error in executing: /home/nikunj/ope/openembedded/recipes/coreutils/
> coreutils-native_8.5.bb
> ERROR: Exception:exceptions.OSError Message:[Errno 2] No such file or
> directory
> ERROR: Printing the environment of the function
> ERROR: Error in executing: /home/nikunj/ope/openembedded/recipes/coreutils/
> coreutils-native_8.5.bb
> ERROR: Exception:exceptions.OSError Message:[Errno 2] No such file or
> directory
> ERROR: Printing the environment of the function
> ERROR: Build of /home/nikunj/ope/openembedded/recipes/coreutils/
> coreutils-native_8.5.bb do_populate_sysroot failed

Does  /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
exist ?


