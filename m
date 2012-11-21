Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbHAo-0006f0-SM
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 21:45:31 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so273299pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 12:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=CJXburiPtIqpjsb8Xzpef2QjJIKITheT78yC+Buipew=;
	b=e+OrjP9cL78WGm3yRLX8gv5WEJwt2neHRLjg0uaDOzsJsc2RJkL2otgtiYjnIdD2WP
	UMUcB9hWvUzeHPk5nHRvBcW+v8C6xK1NpTwUFf9j9Dvebala8BdUVOd5PJgQqeRcWzWV
	gRE8nWcqqY3ASaWR8fu3x6FnzzWfg6fKIkdCH5I4cS7SRq6e+VlIPKejZ7plEUzF+k/Z
	0b4xzzWOvgL/VcfW7iEkkWhsxc9/BJbaN6x2tKFm9e+OprDWDNRrvJ9pGJ0etgNtZjvz
	t6WpF3+oUv5f2TUsrKPW5SIfP9xKP5QyFOdvzLNDHrEYvA/YPgMpmDG5qLQSlvcH+NMv
	4ARQ==
MIME-Version: 1.0
Received: by 10.66.88.41 with SMTP id bd9mr20098554pab.46.1353529884891; Wed,
	21 Nov 2012 12:31:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 21 Nov 2012 12:31:24 -0800 (PST)
In-Reply-To: <cover.1353518890.git.paul.eggleton@linux.intel.com>
References: <cover.1353518890.git.paul.eggleton@linux.intel.com>
Date: Wed, 21 Nov 2012 18:31:24 -0200
X-Google-Sender-Auth: eEneyQSlA0G5_P2_T4Fp-CBCRL4
Message-ID: <CAP9ODKrMGjuWUjvd75tYSr6aNoV6tq5BFjYcm9H3h1nmvWGm3g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/2] ntp fixes
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
X-List-Received-Date: Wed, 21 Nov 2012 20:45:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 21, 2012 at 3:29 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> The following changes since commit 9637cb304f1e9116b037d0afd69014836a2fa512:
>
>   Revert "ntp: Clean up recipes" (2012-11-21 08:32:18 -0500)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib paule/ntp
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/ntp
>
> Paul Eggleton (2):
>   ntp: cleanup recipes and fix SSL support
>   ntp: make servers configurable and default to none configured

Did you check my previous patches which move it to meta-networking? We
need to fix it for systemd.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


