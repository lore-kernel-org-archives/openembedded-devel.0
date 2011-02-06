Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pm89S-0004hB-38
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 18:11:54 +0100
Received: by qwi2 with SMTP id 2so2908210qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 09:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=03/wOhfDPFiaABIxq8pBJN5ZZk2P0lSoG28c78d2bEo=;
	b=igWDc7sjYo/XgIEpK1A8+PSZivFtTCLknsKsC856U2FArM+WyQdSMnQIn+p164DqjR
	haO7eux2Ad6YDJpM+B6hloNxS3cu3m+Oa8BVuUABdX6TsS21xBizhNe0C5znOcLfToIp
	O0fDMRGjO7/lV7Ec1w9DeWHCEtRukc4M44yts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mQFcTI2n9NY95lkBLDVvdxRE9CN40iBdDUKJe4aAHhgDKlO4qGu7BGgQyGjD++eQqB
	2sRBFhrAXxKMWSb5iItU0jZmYzZg16FSXB0aP9B6VTHhEINGUWuJB/FpiZ2ElxQJXaHe
	4gV02mmIx7ty/kqIHLH7Z9W3bdUE036waog7U=
MIME-Version: 1.0
Received: by 10.229.27.80 with SMTP id h16mr10256153qcc.191.1297012252308;
	Sun, 06 Feb 2011 09:10:52 -0800 (PST)
Received: by 10.229.68.100 with HTTP; Sun, 6 Feb 2011 09:10:52 -0800 (PST)
In-Reply-To: <1297011738-4317-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1297011738-4317-1-git-send-email-filip.zyzniewski@gmail.com>
Date: Sun, 6 Feb 2011 18:10:52 +0100
Message-ID: <AANLkTimwUd3qLrmH_FDT121thmT+aPHqqKV-Ga14T+xN@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] apt: remove references to not-built man pages.
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
X-List-Received-Date: Sun, 06 Feb 2011 17:11:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/6/11, Filip Zyzniewski <filip.zyzniewski@gmail.com> wrote:
> Manual pages are not being built because doxygen is currently not
> supported by openembedded.
>
> Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>

This patch requires applying http://patches.openembedded.org/patch/467/ first.


