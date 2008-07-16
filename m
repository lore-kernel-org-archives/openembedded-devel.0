Received: from [64.233.178.243] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KJEP1-00084Y-9m
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jul 2008 23:19:11 +0200
Received: by hs-out-0708.google.com with SMTP id 23so1688130hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2008 14:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=hsWoRlCyMZH6p2Tm60QwGFb5JD23Nz+RKgwzt6xedDk=;
	b=m0O29vmU1OHBXBJBPE98H9+9kLlcsC6xyjFYfDKpVWkQNYgZC0mnKKO4cyS14dveZL
	LyC2VuOjorOqiwS8PJB+gLgMZsD34Yd+FNHgx0ukNs0f+FFFJHB/C+Qnglx2bc+RlPuN
	OUHS6QsP2+6LHy90X1zZlnCP6iOHqNZZcTwf4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=LMnq3inOKgRcwYkUTVK8u/j9Lx1iNLT6vIWjMfiLFeKbXoXNfUI3soyKsUElo8PR+3
	0jPSPma8/iWVAU3HnqLCIgyxWWYlFa2L9xEhJJjVE/SQVClorwzYZe1ysfxZMwLlg5kF
	S7r5Rs+FpnTdpiPIK2LXBJ8OxVec2v03w9DKs=
Received: by 10.100.31.3 with SMTP id e3mr2909280ane.21.1216243109296;
	Wed, 16 Jul 2008 14:18:29 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 16 Jul 2008 14:18:29 -0700 (PDT)
Message-ID: <c384c5ea0807161418w5e6fdd1cgceef7e4f5a165da6@mail.gmail.com>
Date: Wed, 16 Jul 2008 23:18:29 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <735693612@web.de>
MIME-Version: 1.0
References: <735693612@web.de>
Subject: Re: squashfs-lzma bitbake recipe needed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 16 Jul 2008 21:19:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Wed, Jul 16, 2008 at 9:52 AM, Johannes Schauer <j.schauer@email.de> wrote:
> as they are a bit unmaintained i wrote this howto to natively compile them against a 2.6.24 kernel source: http://mokopedia.mister-muffin.de/wiki/BuildingSquashfsLzma
>

I submitted my work agains the 2.6.24 and 2.6.25 trees of the IXP4xx
kernel tree:

http://svn.nslu2-linux.org/svnroot/kernel/trunk/patches/2.6.25/squashfs/

I am using it on other platforms as well.

Regards,
-- 
Leon


