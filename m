Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAki9-0001Dm-Lt
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 17:18:01 +0100
Received: by lbbgi4 with SMTP id gi4so1759679lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Dnw5gBXwcsiKY94m1CSdt4aIdZrzz2ssPZXvc7wM+gE=;
	b=z2Ajn2x/CrjezsVjNTACR5H+FjVv4IyW4wqIyo+B7IVYR+K+mKbbKyi5XDJa8lL+Dw
	EXBz8YPWHJt8cr0H4Zs6VqZT7kZGuTeIliLMO0//hMAT0kpx6F09wzQUjOG2oS1jMZur
	yLPvl4oMxxYI6h2XXVpuou0O1Xim1nNEj8XT9otiAS2kMwepFabsgrhVQE1tnRfh9UwR
	lZV2rRQF/OGJervTYk6l9wNEVw6zCcW/HaNhwlJHRB4EuWmTaB6eic0lOifkb/p7Fp0I
	D9i3obaoZwfiatQT46+rpxtxCN5qhmnHg9XLlqKdEJ0rHYf9+2PzL9wTp5iYamHKahlf
	6EzQ==
Received: by 10.112.37.40 with SMTP id v8mr3188899lbj.8.1332432546466; Thu, 22
	Mar 2012 09:09:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 09:08:36 -0700 (PDT)
In-Reply-To: <1370783.bcqOXY37du@helios>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
	<1370783.bcqOXY37du@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 09:08:36 -0700
Message-ID: <CAMKF1sr7Ntuvz9fMavv+L+MbJ25H=m-O6gaxGN1r1Nm_VGxWrQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 16:18:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 22, 2012 at 7:33 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Sorry to be a pain but can we please call this something other than meta-
> toolchain? We already have meta-toolchain as a well-known recipe and there's
> enough name duplication in OE as it is.
>

I would say the naming of recipes can be improved too. They should
probably be called bare-sdk or somesuch


