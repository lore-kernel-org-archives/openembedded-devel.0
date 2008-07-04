Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KEktS-0008Br-L4
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jul 2008 15:00:07 +0200
Received: by an-out-0708.google.com with SMTP id b38so218069ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jul 2008 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=VWCRMXp4BXMlgVqa5NO4AU1BbOkHOHGo9U4QbDqbP3Q=;
	b=KE5C4L/82ncxKdRHkIQGN40mj5dLmaFTg/0rvd72Btnwcd6QTCwcOrmCrIN3AvdLPC
	ni9Xhu6tAace0Go/E7OVAW6KYLmWek9u6UYo3dc4x5wfO5p+NEQ004PX1JS2fxRCJuZ7
	eOR1WeuC3Dmh47BY1SGMl7SPMhXzwTuTXplFE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=QFcabQO4DyQNHBvfJR9itWdQc0LgpIeZAHpf7n9HuVfmHVdRS1ED3yjctBcViCXwXJ
	p0VyxIPBYlctOCGLU8lagF370q4weDIfhdjXwlQ1zuV4aPEAx0Qroqnm28EyvQRBmAPD
	9PqkQL0fpbD97AM1F/SsjoshP3exia8NoUe6k=
Received: by 10.100.108.20 with SMTP id g20mr674865anc.105.1215176191987;
	Fri, 04 Jul 2008 05:56:31 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Fri, 4 Jul 2008 05:56:31 -0700 (PDT)
Message-ID: <c384c5ea0807040556r44411340ydfdb6d5a0ca04551@mail.gmail.com>
Date: Fri, 4 Jul 2008 14:56:31 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <486DC90C.8050008@spesonline.com>
MIME-Version: 1.0
References: <200807030917.45248.geoffrey@pager.net>
	<486DC90C.8050008@spesonline.com>
Subject: Re: Toolchain
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
X-List-Received-Date: Fri, 04 Jul 2008 13:00:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Stefano,

On Fri, Jul 4, 2008 at 8:54 AM, Stefano Regno
<stefano.regno@spesonline.com> wrote:
> In openEmbedded Project where is the file to undestanding the toolchain?
>>
Start with org.openembedded.dev/packages/gcc/gcc-cross-4.3.1.bb

Regards,
-- 
Leon


