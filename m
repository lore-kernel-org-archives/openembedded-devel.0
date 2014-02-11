Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 21A296EBB3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 15:15:08 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id x13so13194373qcv.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 07:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=YfS1KVM92DL5RIIT6h7Vqpqi8hVd3lLpemsEIZujaog=;
	b=k9hkjxbZ7s5WN1moFo+bCXwb6C7ZERYaPnfS8KOQhgTonKaBqWNsMKIk17iIIseLF0
	qjOUEhm+UNektlCS9Eo2PqAoyI24KeUDm3XnWWYWxaV35xIeM3qidS250TNJ12TkVZbV
	5+kpDeoSC9Uc476fZIhpezJibuM7dKzVq6F52dUfb2qX1E+KN4Iz8m08pumXek1mQtdt
	HBlAxSk5rWFzN91+xs2sASC24blrYO65vW2ShzhI9EpxMq93RVajucoUU4i34oFT4hXQ
	hDvvn7kGhG4CfH9UOozThSuQklpOC8y91rGmHAoDI1V2+oV4Rxjx7cg2xIazCR614c2x
	lFzQ==
X-Received: by 10.140.31.75 with SMTP id e69mr55225656qge.76.1392131708815;
	Tue, 11 Feb 2014 07:15:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 07:14:48 -0800 (PST)
In-Reply-To: <CAMKF1sq=9ycj9XRr9PrMopyy9qpHg_cyxy_6fH++Nq6MqsGU8g@mail.gmail.com>
References: <CANx9H-DMjo0JaHyGqgxh31wX77Z_OmpjF=cgAayLKyYcKLenxw@mail.gmail.com>
	<FC0A8257-46FF-46AD-8061-AD3396E8B243@gmail.com>
	<CAMCfZKH74FMry8-LvajWMEMbx0fEF2OzmZV+iDCkZ6djUCXsrA@mail.gmail.com>
	<CAMKF1sq=9ycj9XRr9PrMopyy9qpHg_cyxy_6fH++Nq6MqsGU8g@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 13:14:48 -0200
Message-ID: <CAMCfZKF7dxy+y8mx_qiM2T9xVNqdLLZ7DX_KjzT9piDqApEpeQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Feb 2014 15:15:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 1:08 PM, Khem Raj <raj.khem@gmail.com> wrote:

> also check version of gcc in meta-angstrom search for ANGSTROM_GCC e.g.


Angstrom:
ANGSTROM_GCC_VERSION_arm                         ?= "linaro-4.8%"
Poky
GCCVERSION ?= "4.8%"

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

