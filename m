Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SpPmN-0006Gl-BA
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2012 22:14:27 +0200
Received: by wibhm2 with SMTP id hm2so5364099wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2012 13:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=n6g4NPUyjhxWMm7Td9qF7IvWwb0g8dnFvM3pttg7CTE=;
	b=pccSGaSqj5+cq2IZctwoUS6ku3rcSlRBy6SEk5emsVvumLM/dnGn9bRL3X4pPLMwDC
	4G3tb436hIM/r0yNtQcRaK3WVhi9/5vCKN47R5QOt4UfFpJimtTIgVQ+qIilmwtKF42K
	hTd2nhMMZds5avor3MCvOM5UKL/2qpdVsPZzj6KDtPbk0qJieAmPUPipeZvsI7Lr3Fzt
	6TXHEZMA46UOhLb/8FQIYX/jAn1PlSVteU4YtI1aOjK1m/k8lN9Z78dLgNmvVtPi2v96
	VGpE/9X1JVwlN5HK/N1QkiyTlV+XQY+GENfELU7/s0u/J+FZZm+IidgkWvKRYI8TAFza
	5CFQ==
Received: by 10.180.105.163 with SMTP id gn3mr58554061wib.2.1342123394001;
	Thu, 12 Jul 2012 13:03:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.30.34 with HTTP; Thu, 12 Jul 2012 13:02:41 -0700 (PDT)
In-Reply-To: <1342120276-15557-1-git-send-email-apelete@seketeli.net>
References: <1342120276-15557-1-git-send-email-apelete@seketeli.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jul 2012 13:02:41 -0700
Message-ID: <CAMKF1srhMSq0OZ097zO4nWQ1QYWovDQ6O_10y35T4UA4wycg5Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [oe-classic][PATCH 0/2] tzcode/tzdata: update SRC_URI
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
X-List-Received-Date: Thu, 12 Jul 2012 20:14:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 12, 2012 at 12:11 PM, Apelete Seketeli <apelete@seketeli.net> wrote:
> Hello,
>
> The official repository of the time zone database was shut down on
> 2011-10-06, so the corresponding recipes needed to be updated to fetch
> the time zone source packages from alternative mirrors.
>
> The two patches that come as follow up of this message is what it's
> all about.

please add [maintenance-2011.03] to subject and rebase the patches of
the same branch in order for them to show up in maintainers sandbox

>
> Apelete Seketeli (2):
>   tzcode: update SRC_URI
>   tzdata: update SRC_URI
>
>  recipes/tzcode/tzcode-native.inc |    4 ++--
>  recipes/tzdata/tzdata.inc        |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


