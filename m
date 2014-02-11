Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 24A0F6E717
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 17:23:32 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i8so13443830qcq.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=De/t+9uBlpi7Sun9SXwqXhoqHqAF25xKFSoephZuS+U=;
	b=zs7CbQaKg+Ci0nnYv2VkfcB4fsCuN0YqHuBmv5/75CcdFHszLrG/YtEBsyv5hhZRlh
	rlvCCqZ3yqwGEpkRBwL/mibGihdiRE5hpjHlmTQ+q7ca6ZcOfdMHcbdmJjmZlQXmnx0F
	jkvlywrqPI1VFQQstVncaZRg/PZ5VaaMAjMB3jZ/hRdghOLvhyXQsEBZKtOe7x/kA7VV
	LL5X6i/5PD68r/pW84JDYHUIbmb670KFS4/C24pOdJSTFcpdZulQcGUUqNa9geuA7imU
	xm6QdUImPPkhb4HbCvfCK9BC7SQbvlXkABGN6dExeHcnnTwgrYC7fdEPIvsfRDCRMLxj
	ktjg==
X-Received: by 10.224.75.73 with SMTP id x9mr60233242qaj.36.1392139412411;
	Tue, 11 Feb 2014 09:23:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 09:23:12 -0800 (PST)
In-Reply-To: <CAMKF1sqrgQCf+EegF3qqe4chVBmO+qBDnhGD76uDX+mxOrV2cA@mail.gmail.com>
References: <CANx9H-DMjo0JaHyGqgxh31wX77Z_OmpjF=cgAayLKyYcKLenxw@mail.gmail.com>
	<FC0A8257-46FF-46AD-8061-AD3396E8B243@gmail.com>
	<CAMCfZKH74FMry8-LvajWMEMbx0fEF2OzmZV+iDCkZ6djUCXsrA@mail.gmail.com>
	<CAMKF1sq=9ycj9XRr9PrMopyy9qpHg_cyxy_6fH++Nq6MqsGU8g@mail.gmail.com>
	<CAMCfZKF7dxy+y8mx_qiM2T9xVNqdLLZ7DX_KjzT9piDqApEpeQ@mail.gmail.com>
	<CAMKF1sqrgQCf+EegF3qqe4chVBmO+qBDnhGD76uDX+mxOrV2cA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 15:23:12 -0200
Message-ID: <CAMCfZKGW7_yu3nB71FN8ru64HGjbzD6NJaOzZR0D-Gkuvojyow@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: xbmc build failing
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
X-List-Received-Date: Tue, 11 Feb 2014 17:23:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 3:03 PM, Khem Raj <raj.khem@gmail.com> wrote:

> > Angstrom:
> > ANGSTROM_GCC_VERSION_arm                         ?= "linaro-4.8%"
> > Poky
> > GCCVERSION ?= "4.8%"
>
> OK how about eglibc


Angstrom:
Could not find. :(
Poky:
EGLIBCVERSION ?= "2.18"

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

