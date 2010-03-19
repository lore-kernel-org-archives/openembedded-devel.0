Received: from mail-pz0-f173.google.com ([209.85.222.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1Nsjte-0005Df-Ee
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 22:38:23 +0100
Received: by pzk3 with SMTP id 3so462772pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 14:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:from:date:message-id:subject:to:content-type;
	bh=RwD7GZ7dINf0prjjtevX342nCLv2EJYwuJY3VXMB+40=;
	b=mBHYHhOY8WsWIxZv8W1zSPTbVv0QsryS8W2+ZD52JM/7eyS1eEtV4wCCNQB8ins3uY
	S1kGPyQk6zh7Fc1zoISarEEPfOGghAXQLh1OqZGIo8xFw/Er2SBdaNburQxluK/LxCZy
	OVa8XxwU1YpkdgNnNY2+qAFJ9HPPUAwu3AYzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Y4MjGF5MrXylflaLU/2hDjLixvDCfHQ6TKo79zIhqMFPr+xEfK2T2QA4UCb/FSsA3B
	o9pTzDJDCP8y3bA6YLe/HHuYrBi1N9EltRZ+pl6sJLg/QDwEl2cC7Ny/28rnKAnDqtep
	3uQU3xym61aE5TtJv/Z+dJAvV3cRHT3dgNDoI=
MIME-Version: 1.0
Received: by 10.141.90.21 with SMTP id s21mr2945558rvl.240.1269034516140; Fri, 
	19 Mar 2010 14:35:16 -0700 (PDT)
In-Reply-To: <201003192355.52441.roman@khimov.ru>
References: <1239889359-13953-1-git-send-email-khimov@altell.ru> 
	<1268769038-30979-1-git-send-email-khimov@altell.ru>
	<201003192355.52441.roman@khimov.ru>
From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 19 Mar 2010 14:34:56 -0700
Message-ID: <bd4a003f1003191434t57c3f126gdc0f53790ef75aed@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.173
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cmake.bbclass: force CMAKE_INSTALL_SO_NO_EXE to be 0
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
X-List-Received-Date: Fri, 19 Mar 2010 21:38:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 19, 2010 at 1:55 PM, Roman I Khimov <roman@khimov.ru> wrote:
> So, I've rebased that to current, it looks like an obvious one and still no
> one cares. As per policy, I need two ack's on this one. Should I break that
> and push it or just wait another year till someone else interested in cmake
> will ack it?

Hi Roman,

I'm not in a position to ack this as I'm new to this mailing list. I
use OpenEmbedded+Cmake for several projects though and this looks like
a sensible fix.

-Ash


