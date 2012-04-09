Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <matti.kaasinen@gmail.com>) id 1SHJNo-0006i1-NN
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 20:32:08 +0200
Received: by iaag37 with SMTP id g37so6229195iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Hp3U0Dex0m2fYPbNu2XPxiErUwSgYTCRWhpUpyWNN7c=;
	b=WTV3zwPqztoImrOsI9HX/xlBwEY5q6shau9d8rpFCrdPPxkRkmsQHUWFXS42m5K6q2
	HJzMjpz6G3alpFGIa3C70iyGBSKe6RLmhTD8/Mwn/qLhdrB1iipXWiE5qCe+DODtQDlq
	1HQHetwg9GpMSTZ+Ata9rpOfJ96B9vMSMMlkedHA+T3PIYLi9/PC/cs5kf4QPnCxyx6U
	xsox3LlqM4eSTFZFaz5TqiMU6PSiu8LGAmhW/nmjwlbsZgle64IarQYRt9jyCgjGkRXU
	45npJ9n0D9javiXmmuczvkwTHr5NLmQ+ccKSzLR2dCNSSvh3OML+JH6odn04uxT13cjR
	oJfw==
MIME-Version: 1.0
Received: by 10.50.222.233 with SMTP id qp9mr6730283igc.58.1333995771276; Mon,
	09 Apr 2012 11:22:51 -0700 (PDT)
Received: by 10.42.154.5 with HTTP; Mon, 9 Apr 2012 11:22:51 -0700 (PDT)
In-Reply-To: <CADnUhn2NQbrW9GAUpvS=0VhPjAAvGdkv1TvAMWbi9SWEcw_6qA@mail.gmail.com>
References: <CADnUhn2NQbrW9GAUpvS=0VhPjAAvGdkv1TvAMWbi9SWEcw_6qA@mail.gmail.com>
Date: Mon, 9 Apr 2012 21:22:51 +0300
Message-ID: <CADnUhn14JkSBPgPp5qeqCph6e4867-brrSA+nskcmD7mU7BKpA@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: DOCUMENTATION of R* variables like RDEPENDS
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
X-List-Received-Date: Mon, 09 Apr 2012 18:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi developers!

I was faced with problems when using RDEPENDS dependencies without
_${PN} extensions. Actually both conventions were mixed with my
OE-classic design. I was guided to correct direction by Angstrom
community's kind guidance. However, I feel OE official User Manual
has documentation problem regarding these R* variables that
link below describes in more details:

http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2012-April/005944.html

take care,
Matti


