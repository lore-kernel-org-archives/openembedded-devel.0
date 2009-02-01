Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1LTcG6-00067G-SI
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Feb 2009 14:21:13 +0100
Received: by fg-out-1718.google.com with SMTP id 13so355063fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Feb 2009 05:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=iMPSaZOimsFthhz9v/4wTXzQ3vafLA7PjQycJsH78KE=;
	b=W9InK+RSHctG1+cCRT8TGz89VsbPxlR1VWeW6mTCXAk4aNBpCvfXze8dBbMXDNppRj
	bbI7m51tw+YpktBDlns4QDebu7xkMah6OIiaa/sXxKaNns47t6T2JVudol97OMA6e2Vk
	jH9uqOFeBMLFwlCQsl/Txw6q3BTe97dUlrMEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LdVd0IlOXGB93+S4Q790lGjFghkwBujcbdINAA33VaWAKWp45U6N4RlP+w/3pEVXXf
	XRAdI0OFfabMZOdLGOwVK5x9Cocczep/161kaFUCGYKpYs8/I118JctsLXMkqAY8yb6G
	AqWvBIfJmOCPDedRzpiiqyNLjhTRNCX8p806s=
MIME-Version: 1.0
Received: by 10.103.220.18 with SMTP id x18mr1417982muq.38.1233493996392; Sun, 
	01 Feb 2009 05:13:16 -0800 (PST)
In-Reply-To: <4983F48F.20208@dls.net>
References: <4983F48F.20208@dls.net>
Date: Sun, 1 Feb 2009 18:13:16 +0500
Message-ID: <1fea892d0902010513l44053e9atde45d4f2024c77a1@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: krb recipe
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
X-List-Received-Date: Sun, 01 Feb 2009 13:21:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sat, Jan 31, 2009 at 11:49, Mike (mwester) <mwester@dls.net> wrote:

> configure: error: changes in the environment can compromise the build
>  <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>


mit-kerberos configure not support crocc-compile enveroment.

