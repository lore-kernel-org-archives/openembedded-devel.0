Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4176E877
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 19:20:12 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id f11so22053763qae.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3hD+QZVMfVt/Fafp+rTCvazEjU3XhGOrARQZVMkT3vo=;
	b=rzcV5i8sstpbN81ElsvMz23rOmSf2pzIgl4PGJIS42FAi1XgYlM6Z1VlqdiWRByaPw
	BpzvV4qRwJ2PeBbOLyEd1aMpYE15Vaxrh89zinL4ndkq1ZRD6RpXU9yf4lTt88Df2e5T
	MugK63hTs7BvcZc6A5henUHD4hwQJZoXNOLV4DDrovKzcgYL3vo199o5pStt3EUihFy8
	rW1FnxmQckExvzdrPJt6IQXAuL1SK539HlIgvwuxsXVf3ATrZj2FhBIWpLQRCboAFhtv
	KNiD4vWvIgJF/E2xaJEDRkQd6CLqoAakxj4JacMkg5oFCRRsQnLgg32B14mt3mGH/9lr
	a+aQ==
X-Received: by 10.224.151.147 with SMTP id c19mr4585286qaw.86.1392664810850;
	Mon, 17 Feb 2014 11:20:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Mon, 17 Feb 2014 11:19:50 -0800 (PST)
In-Reply-To: <20140217191334.GR22890@denix.org>
References: <CAMCfZKG5Pk5W4nuDQvTrJb1CHdrTmKNBdN2_nkOmr9PfX_0b=w@mail.gmail.com>
	<20140217191334.GR22890@denix.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 17 Feb 2014 16:19:50 -0300
Message-ID: <CAMCfZKGFdYeF=xEn8bj_r5oBTeUUM=zDkcVeL1xXbRdN4g5MiA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: mpeg2dec license
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Feb 2014 19:20:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys,

On Mon, Feb 17, 2014 at 4:13 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> LICENSE = "GPLv2+"
> LICENSE_FLAGS = "commercial"
> LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>
> file://include/mpeg2.h;beginline=1;endline=22;md5=ead62602d4638329d3b5b86a55803154"
>
>
> http://cgit.openembedded.org/openembedded-core/commit/?id=43410523a07d9eb52a7d57ae3dc1cc320cbbc6f9
>
> The code is still marked as GPLv2+, but the flag is set as commercial due
> to
> MPEG2 licensing agreement - basically, you are required to pay licensing
> fees
> to MPEG LA in order to use MPEG2 codec:
>
> http://www.mpegla.com/main/programs/M2/Pages/Agreement.aspx
> http://en.wikipedia.org/wiki/MPEG-2#Patent_pool
>

Thanks for the explanation.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

