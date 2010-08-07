Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1Ohmu1-0000iu-U1
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Aug 2010 19:10:14 +0200
Received: by iwn38 with SMTP id 38so2290744iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Aug 2010 10:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=eY0GwHpAcaf24o1kPVe+oyo4z+PK2+iwS9/yroNDGws=;
	b=McBSoeEJhvmpIggz+cdkVOpEeVVWFsePU8p674/VajuYg1uCwdE1GUIM7OxyyAeuy/
	voqS8WYkeLBUb9TuaqRLULIvOBObwC4W1wBezngVmycuqtk5iJjAqaqtmI8MadtKknGa
	a54Uf7A/pBgJkXvojtgbE26MN9OY2rnyGLFMo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=YV0k1Fy8SUL4e8odfMHOSG66aXqOOSiVsmXU0aI83t89Nf2w3GTM5ZKncUBRAJdRzQ
	yTjdzYm3z3s1PuBuRkp8jMaMlo6PhxTRMjUwb477mowO0V2OhUUap2LvPmnH3ppW29V3
	s4E3SLtkYEWDi8gWMPzPSJ14E4JM7aqqih5Ec=
MIME-Version: 1.0
Received: by 10.231.33.6 with SMTP id f6mr7576371ibd.182.1281200977613; Sat, 
	07 Aug 2010 10:09:37 -0700 (PDT)
Received: by 10.231.145.69 with HTTP; Sat, 7 Aug 2010 10:09:37 -0700 (PDT)
Date: Sat, 7 Aug 2010 22:39:37 +0530
Message-ID: <AANLkTinV5sK_s_oNS5XjbzphdOFkMi2jvkOwa4-zMj8k@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: getting gstreamer interfaces on openembedded
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
X-List-Received-Date: Sat, 07 Aug 2010 17:10:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello All,

I am trying to build a gstreamer application which uses
gstreamer-interfaces,
(to be linked with -lgstinterfaces-0.10) but I could not find any recipe
for that.  Any idea from where I could get a recipe for gstreamer
interfaces?
Is it ported on openembedded?

Thanks and Regards

Anand

