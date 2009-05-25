Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M8ZLE-0007G6-W5
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 14:31:45 +0200
Received: by bwz19 with SMTP id 19so3069110bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KmCTsxef+ktXNn2RHWudUhBagLtOC+JtmmDkyrnWtGc=;
	b=vHSFUZsFLh+cRcqmMP0c8KdUWcztKUP0g8VAuEN72KQVhGdthW0acrJZVf/K2A5cVf
	QxdBlH6/T8GZ1n7I4N/J7Yd6qLOuh3DnJ5ZbwOL9gYfhVp5mjvxYIJO6SArxXUbErHWn
	erhszv1y6XnARiOGuBSEBNcKhoTWJN5rcawG8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LBbVj9l8zgw7ipN5MufM4Da1hyeEiCQK5cn92NDCmOTZXvAooRIxyQcFrjRQU4Y9wR
	xHd1Xd+bNia7bfvdZ+ilBWbMixiCnrrx4v/rFZBvBqg+7aeQ0zjF5whkbu4WarXAqW/7
	iiTWFBCz0WBc2Y14aEOq8TLKzErA4LELxOML8=
MIME-Version: 1.0
Received: by 10.223.119.5 with SMTP id x5mr3564367faq.40.1243254223205; Mon, 
	25 May 2009 05:23:43 -0700 (PDT)
In-Reply-To: <gve10k$bm$1@ger.gmane.org>
References: <d1b08f940905250229o2482fda0l7ec6e57804542665@mail.gmail.com>
	<gve10k$bm$1@ger.gmane.org>
Date: Mon, 25 May 2009 14:23:43 +0200
Message-ID: <d1b08f940905250523h758b7472t89f6bc5a9d69aaf7@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][Zaurus] (Re)move obsolete kernels
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
X-List-Received-Date: Mon, 25 May 2009 12:31:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rolf,

you know mine was a provocation...and a reminder for you.

Still some minor cleaning will be necessary (old recipes should not
pollute the build with unresolved dependencies).

Regards

Andrea


P.S. pls let me know about your results with sharprom-compatible.


