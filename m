Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LmjpR-0004kx-A8
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 08:16:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 5C6323A00C;
	Thu, 26 Mar 2009 08:15:02 +0100 (CET)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwE0-5xWp3Pv; Thu, 26 Mar 2009 08:15:02 +0100 (CET)
Received: from lin01.mn-solutions.de (pD95F9C30.dip0.t-ipconnect.de
	[217.95.156.48])
	by mx51.mymxserver.com (Postfix) with ESMTP id BD2943A007;
	Thu, 26 Mar 2009 08:15:00 +0100 (CET)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 4E17C1E012C; Thu, 26 Mar 2009 08:15:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id ADC611E0124;
	Thu, 26 Mar 2009 08:14:56 +0100 (CET)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2009 08:14:38 +0100
User-Agent: KMail/1.9.7
References: <49C9FEFF.2010802@bolloretelecom.eu> <1237985345.8711.6.camel@opal>
	<49CA6B02.9070600@bolloretelecom.eu>
In-Reply-To: <49CA6B02.9070600@bolloretelecom.eu>
MIME-Version: 1.0
Message-Id: <200903260814.38745.hs4233@mail.mn-solutions.de>
Subject: Re: Dropping qt4-x11-free versions 4.1.2 and 4.3.3?
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
X-List-Received-Date: Thu, 26 Mar 2009 07:16:41 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> * who is the maintainer for the neuros-* packages? They are in
> a really sad state (staging rules are only half-writtent so
> they mostly don't build), and they keep coming up when I grep
> for Qt-related stuff. I am wondering whether they don't belong
> in "nonworking"..

They look like abandonware to me, e.g. upstream nothing has been 
done at all since half a year: http://git.neurostechnology.com/


