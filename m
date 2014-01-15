Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 91FA56E2DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:45:47 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id i4so1060646oah.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=TgBpTKZk4exaV/tLwYbRThaRYrZvXqxCrwH80sdqGeI=;
	b=ruYjOeF6AKEh116chBnsgFxbFP+yW4LjdN5QfqJrMZI2xgmA6QVpqlTElBZNWNqyuv
	KsIuwk6oZ869YUYqWKj6nIBjXUyjG4u1s5bNAA503ER1SPkAyOQNEXfLPOWX8UARWWnb
	ShWp/Y7JvXOlRmBmcZN9kfhQbxGOFh7ET+hLhzA5dR/7fD/WFkuA4hra33h4axApozAO
	ZpQP6G4R+UKuRN9ZerkeRQVjzLpuE/Gv1u1Hgv8ZjyRh9ZnBVcvNNqPwtWQApyJ/JD+z
	oPZQ/TyAW0I7y93RjTa6zfHMV9q0R+hQ7FrAauXRYfJE3x+Hv7Tt7p0VWVc+nXiBa7Aw
	d0qQ==
MIME-Version: 1.0
X-Received: by 10.60.56.70 with SMTP id y6mr1410372oep.32.1389786348643; Wed,
	15 Jan 2014 03:45:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:45:48 -0800 (PST)
In-Reply-To: <1389785832-3120-5-git-send-email-ross.burton@intel.com>
References: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
	<1389785832-3120-5-git-send-email-ross.burton@intel.com>
Date: Wed, 15 Jan 2014 09:45:48 -0200
X-Google-Sender-Auth: aEIc29l3Yh-6EbWHKXBVVptvlYU
Message-ID: <CAP9ODKo7MBBy_j7zz+yUmP2D8KYwyDLiUVM+u6+p_NiSH_Aj=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 5/5] libsyncml: move build dependencies from RRECOMMENDS to DEPENDS
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
X-List-Received-Date: Wed, 15 Jan 2014 11:45:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 9:37 AM, Ross Burton <ross.burton@intel.com> wrote:

> Putting build dependencies into RRECOMMENDS isn't going to work, so move
> them to
> DEPENDS.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

