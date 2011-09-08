Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R1jJY-00036f-Sq
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 20:27:05 +0200
Received: by vxj12 with SMTP id 12so941561vxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2011 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wSRwAlAy+YA4UfU4yzuh4uorgu287TROfxT+X55maNU=;
	b=nyvHiwlHjX9XSaoKuTMr3a+6cTokEjMRVLFumsDR+RkrNG2ZJpH7H7voZN60oI5xuR
	UMm97QMUg+XE+eLecZlodbM3sxAAjhuOWafSqF/Qev2NvGlIuXTOyAqx8R4BNy28ngLM
	IEgwx7j3h4ERFdX+ujYottmuc++2GbvR5helA=
MIME-Version: 1.0
Received: by 10.52.65.65 with SMTP id v1mr1164188vds.19.1315506116905; Thu, 08
	Sep 2011 11:21:56 -0700 (PDT)
Received: by 10.52.167.72 with HTTP; Thu, 8 Sep 2011 11:21:56 -0700 (PDT)
In-Reply-To: <4E69004E.30701@gmail.com>
References: <4E69004E.30701@gmail.com>
Date: Thu, 8 Sep 2011 19:21:56 +0100
Message-ID: <CAPhDKbFyvpi-HrwM0QJ6=amZ=q68PA8eqsyCHi55zZ9h5r_Kiw@mail.gmail.com>
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake -b workaround
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
X-List-Received-Date: Thu, 08 Sep 2011 18:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 September 2011 18:50, Jim Qode <sagasolauyeoldum@gmail.com> wrote:
> Hello,
>
> I updated my build environment today. Now bitbake -b fails with the
> following errors. Is there any workaround I can use to continue working
> on my project before a patch is issued?

Have you by any chance updated python ?


