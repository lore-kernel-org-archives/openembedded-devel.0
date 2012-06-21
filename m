Received: from mail-qa0-f50.google.com ([209.85.216.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1Shei9-0000ed-7x
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 12:34:01 +0200
Received: by qafl39 with SMTP id l39so1316154qaf.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yhaDE1dNSagX1lB04XuVj2r24q4vGV8YJEyjHD0NOLY=;
	b=QsaVQF5Oc+oRIRRW33YW8JkNm2xgGb3bKAju0ybX7FXUY2AnHJ9/WumoXwr0I8JwfN
	dcmeIhnigQ7CbRhiEct2m0/ZMvr7p1RJgHFUlWpXWY7Q8Bn2iUXD5gJzRIjAtixaZaiY
	FFQp3YlnC70rbJXASK8qPaU04/I73sI7CkdhEqiSvuFUnkFmb0VP4uOhN8kl4MXYOoRU
	x4pDaSpPx0Q5I1Ncs+2/WffykshSmhw8lY1g0kDaoe80Pvo/hcXP3uBRZG04r6xmxQRe
	6o6+OFdsyGBABvRZkq2kziy+4PnPa00b8CqN4EOlS1vI48Usmac1hl00GSkzbet3dKHZ
	7Pew==
MIME-Version: 1.0
Received: by 10.229.111.195 with SMTP id t3mr3551962qcp.60.1340274195064; Thu,
	21 Jun 2012 03:23:15 -0700 (PDT)
Received: by 10.229.223.208 with HTTP; Thu, 21 Jun 2012 03:23:15 -0700 (PDT)
Date: Thu, 21 Jun 2012 12:23:15 +0200
Message-ID: <CAC+thW0R2ieg-q9mavCGQ2C8DgHmjh-aXVLHy4058Xcz9r9-xw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: maintainers tool to monitor upstream
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
X-List-Received-Date: Thu, 21 Jun 2012 10:34:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Are you experienced recipes' maintainers using any tool to
automatically monitor upstream projects for new releases?
I'm not planning to become a full-time maintainer but, since I
recently submitted a new recipe for meta-oe, I'd like to keep it as
up-to-date as possible. I asked myself if a suitable convenience tool
was available. After a quick search I found solutions like cnucnu
which appear to be used by Fedora for a similar purpose. Must read
further to see if they could fit.
Just wanted to throw the question to "real" maintainers first.

Regards


