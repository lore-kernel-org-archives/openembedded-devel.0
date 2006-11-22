Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1Gmzct-0005AJ-Jd
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Nov 2006 22:27:27 +0100
Received: by ug-out-1314.google.com with SMTP id e2so264790ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2006 13:24:34 -0800 (PST)
Received: by 10.78.193.19 with SMTP id q19mr8309318huf.1164230672881;
	Wed, 22 Nov 2006 13:24:32 -0800 (PST)
Received: by 10.78.164.9 with HTTP; Wed, 22 Nov 2006 13:24:32 -0800 (PST)
Message-ID: <f96d234e0611221324o352521ddj229fb267b995396b@mail.gmail.com>
Date: Wed, 22 Nov 2006 16:24:32 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d46153c40611221320l1226d03dtb2948a8f42a04cdd@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40611220800m4e715362v713c24f5853238@mail.gmail.com>
	<d46153c40611221320l1226d03dtb2948a8f42a04cdd@mail.gmail.com>
Subject: Re: Angstrom, compulab-pxa270, and gpe-image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Nov 2006 21:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/22/06, Andrew Paulsen <andrew.paulsen@gmail.com> wrote:

>
> Upon further inspection, it appears that the distribution is built
> with attributes [VFP float format] [software FP], while the
> CL_FlashDrv binary from Compulab has attributes [FPA float format]
> [software FP], thus the error.
>
> Is there a way around this?

Things are working here with a non-EABI toolchain -- you may want to try that.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


