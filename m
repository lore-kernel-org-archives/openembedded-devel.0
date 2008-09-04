Received: from [64.233.184.228] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dfarning@gmail.com>) id 1KbLet-0003Tn-HT
	for openembedded-devel@openembedded.org; Thu, 04 Sep 2008 22:42:27 +0200
Received: by wr-out-0506.google.com with SMTP id c53so150594wra.20
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Sep 2008 13:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to:cc
	:in-reply-to:references:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding:sender;
	bh=sf6HncLosC8Dw+u1UNtMku4Qf/YcxBhEdBv67Gr3Dx4=;
	b=SI+vhVEyJ3xxttTDwT+xrO4WIMk71P7yyGcAy5rq7BybmCmhFMezmNC30HCkihu4XA
	nPkBUvV/eLaKh4J7Nu6wyXQgxKGy4UDECRq9Q2a5toIYxUvfgNVuRc5ifGbkf8evDq9I
	28feFLHK0IjdH09rx9dNSAPLP0BxlTnJHUjlQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:in-reply-to:references:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding
	:sender;
	b=UO77LhGLrjEQeDHm7OKa7Ij3/aisL69wQzZNMgwRXYTf0oSgZDIjhB4BArkpkhO40s
	hK/LUyHJ+H4mIlzVB9OV/11N9gv5L4Z9kJzww1U3UBm66V7fFwmbq2viQJT2OB53lsjL
	7Ufzi+X0WPx90Ncy3HAoAkGeYiMJ15kFpQidM=
Received: by 10.90.49.3 with SMTP id w3mr13684916agw.33.1220560815521;
	Thu, 04 Sep 2008 13:40:15 -0700 (PDT)
Received: from ?192.168.2.3? ( [72.160.221.202])
	by mx.google.com with ESMTPS id 5sm16490115agc.29.2008.09.04.13.40.13
	(version=SSLv3 cipher=RC4-MD5); Thu, 04 Sep 2008 13:40:14 -0700 (PDT)
From: David Farning <dfarning@sugarlabs.org>
To: Edward Cherlin <echerlin@gmail.com>
In-Reply-To: <e574f6eb0809031314q723bb96elad9393751b39c204@mail.gmail.com>
References: <1219364965.7212.319.camel@dfarning.desktop.org>
	<6051830F-D75C-4B5F-8509-1C06F23450FF@student.utwente.nl>
	<e574f6eb0809031314q723bb96elad9393751b39c204@mail.gmail.com>
Date: Thu, 04 Sep 2008 15:40:12 -0500
Message-Id: <1220560812.10983.170.camel@dfarning.desktop.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Sender: David Farning <dfarning@gmail.com>
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	Koen Kooi <k.kooi@student.utwente.nl>,
	beagleboard <beagleboard@googlegroups.com>,
	Jason Kridner <jdk@ti.com>, Sugar List <sugar@laptop.org>
Subject: Re: [sugar] Sugar on the BeagleBoard using the OpenEmbedded	toolkit.
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
X-List-Received-Date: Thu, 04 Sep 2008 20:42:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-09-03 at 13:14 -0700, Edward Cherlin wrote:
> On Mon, Sep 1, 2008 at 3:57 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> >
> > Op 22 aug 2008, om 02:29 heeft David Farning het volgende geschreven:
> >
> >> Welcome to the Sugar on the BeagleBoard project.  It seems that we have
> >> all of the pieces in place to do a port.
> 
> Very good. Thank you.
> 
> I see that BeagleBoards list at $149. Do you have any idea of quantity
> pricing? Apparently TI sells them only through Digikey, which only
> gives single-unit prices on its site. I can see applications for data
> acquisition and control worldwide, as well as for teaching embedded
> systems development. I am thinking of possibilities for placement of
> systems through microfinance, assuming that we can find and document
> ways to increase income using BeagleBoard+Sugar more efficiently than
> by other methods.

The BeagleBoard is a development platform for introducing developers to
the OMAP35x family of processors.  I don't believe that it was meant for
endusers.  The interesting question I my mind is, 'Who will be the first
to leverage the chipset into low cost thin clients or laptops for use
classrooms?'

thanks
dfarning  



