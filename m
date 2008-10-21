Received: from [209.85.217.20] (helo=mail-gx0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1KsHFf-0006PT-2q
	for openembedded-devel@openembedded.org; Tue, 21 Oct 2008 15:26:23 +0200
Received: by gxk13 with SMTP id 13so6365891gxk.12
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Oct 2008 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=K0pIdrNrsOmawdZN+5J964Yzr0/rt1v7nHa7sx8/DBk=;
	b=CSOLtBIlFjMlfNXHmhNuhJS3BRq+MgaqNcw1Op4fU3oZWtAkYEeUI2H02Ut5iUTy9i
	5cD2/O35n0qts/+N7EPbnQ5sEIINRqocsmISp43/wemsOnBobUMrd1HMkEz2Qmpz9wNx
	HchIVcbzKy63YLYgtNA/qhnymskpVTlOsjS+U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=eT009s2r1Gw/Q/jcjYW3da/P7lsuosF9Ps30v1uXiR0Z7+eAclpR8DPPwEPED3aAJ3
	SaSPLsRFJ48Jcj4tGUfrk88esKJJenBnii0Fo2IAS3Eperdff26eQ1VRaMD6B+TDoOiv
	yOD3az832cCjmQ4Zye+XAx6EB6xbWjGbmCtLc=
Received: by 10.150.156.20 with SMTP id d20mr13397686ybe.204.1224595558634;
	Tue, 21 Oct 2008 06:25:58 -0700 (PDT)
Received: by 10.150.212.20 with HTTP; Tue, 21 Oct 2008 06:25:58 -0700 (PDT)
Message-ID: <48239d390810210625t3725a5e6j56278e74f06ebdfa@mail.gmail.com>
Date: Tue, 21 Oct 2008 17:25:58 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: "Discussion of the angstrom distribution development"
	<angstrom-distro-devel@linuxtogo.org>
In-Reply-To: <gdkiis$9ig$1@ger.gmane.org>
MIME-Version: 1.0
References: <gdkiis$9ig$1@ger.gmane.org>
Cc: angstrom-distro-users@linuxtogo.org, openembedded-devel@openembedded.org,
	openembedded-users@lists.openembedded.org
Subject: Re: [Angstrom-devel] Tosa testing kernel
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
X-List-Received-Date: Tue, 21 Oct 2008 13:26:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Oct 21, 2008 at 4:39 PM, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> Hi,
>
> I finally had some tome to build 2.6.24 kernel with debug info I'd need.
Did you mean time?


