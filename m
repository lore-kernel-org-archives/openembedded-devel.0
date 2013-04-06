Received: from mail-oa0-f54.google.com ([209.85.219.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UOTev-0003F9-Ja
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 15:59:58 +0200
Received: by mail-oa0-f54.google.com with SMTP id n12so4832522oag.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2013 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=UVhP0r6ErA93SSUZqIqbV29LZo/F5FcrS4Be+AK2/VU=;
	b=ZwAUCxVI0WWRaRmOdJliJt8t0OE++XmxsDTDFhgImfS4Af0JytozTYh40fWkWxTZOC
	mCtBs3b/UvrFZxi8bIC3RFWKqWgPtoRMhdBFgxAQJ7PvltLImALu55X0nucjwSjufyCt
	dO2z1lq+897TbY2cz7IDsJ9Y9ngKx5t0odErITQY4sp1kB9lp3Z+Y8zqOhGZfqanymL7
	CNN3dzpN5/XjiROw+sWFawgvvmLW1pAF8dmPATBo7hY15VEuxqj0Bf6JWtGhdd/5oh9A
	B/4B74I8FYQXiRqUfWUA0kLBHhWK0Bfc6Oc1duAJvbHo4NIcqOlX6vxrRQCXsLGY9nXW
	f88g==
MIME-Version: 1.0
X-Received: by 10.60.11.228 with SMTP id t4mr10633952oeb.42.1365255761477;
	Sat, 06 Apr 2013 06:42:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 6 Apr 2013 06:42:41 -0700 (PDT)
In-Reply-To: <cover.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
Date: Sat, 6 Apr 2013 10:42:41 -0300
X-Google-Sender-Auth: vM3LM22R-dIM8-C3EyM42bu8ZnY
Message-ID: <CAP9ODKoe-5ZfeR+Wi9HZXYPQJ_2GWLzLTaF1Xm0dLJGLKdCySg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/4] Clean up recipes
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
X-List-Received-Date: Sat, 06 Apr 2013 14:00:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 5, 2013 at 8:35 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Drop some items that should no longer be in meta-oe.

The Qt ones need to be reworked to keep the upgrade path. I replied accordingly.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


