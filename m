Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ8Kp-0003NJ-IY
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 22:50:27 +0100
Received: by lahd3 with SMTP id d3so1285876lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 13:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4g9/LuOnf9e7+NsNTQ4tbFJntk74wwDKMeBuXdGdVjQ=;
	b=EhSqBZJMO7CqDJE0/2CsrxerTPcStontAHy8WCjjYx0WWB1HSQdgdS4ScOU27HpBlk
	diQnw1i71oAz112Wj618kVOlZQOgVmG06F6Unh9le2gdxb7jrtIKv37Io+lqlrxyWPN5
	XmCIW1IpWeTsWHavrTYm0jz77e4/15b8zCp1Y=
Received: by 10.152.128.103 with SMTP id nn7mr3651052lab.48.1323467016414;
	Fri, 09 Dec 2011 13:43:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 13:43:05 -0800 (PST)
In-Reply-To: <4EE27BB8.3020903@opendreambox.org>
References: <4EE27BB8.3020903@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 13:43:05 -0800
Message-ID: <CAMKF1speb=XwcnmmhAC3hqKZ7tc8yDXOLNEhXweuyY+sSzx_Gw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: fakeroot 1.15.1 in 2011.03-maintenance
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
X-List-Received-Date: Fri, 09 Dec 2011 21:50:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 9, 2011 at 1:20 PM, Andreas Oberritter <obi@opendreambox.org> wrote:
> one week ago, the fakeroot recipe was moved to 1.15.1 [1] in order to fix
> a download problem, even though previous attempts were rejected [2,3].
> Well, now I get the following error:
>

we should stash the tar file on sources.openembedded.org and be done with it.


