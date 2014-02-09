Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 717DF6ED46
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2014 10:29:14 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id c9so8884764qcz.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2014 02:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=chqg2tImtDefhqVl1GBB9qRcLFyAjjQz1Q5Z4GGvzZU=;
	b=v7OWqML+Zip3Px8yZEegq6sijknSxLCyzsRR/C36jsSHhbtFzn1GQ0v4fz2iW2+mqU
	cQs6e8f/AnHNk/eQb7D4vSLx2E1398o/Susyn44+2+bAFCUzNQcD6NX6nqZGdEjQkmaC
	FuwKOYW/EOrBXcSMXodvo0fFRCvjoelaoKlB6ccl3rQe/4Ci2hQ9VkYQ8KCse35J2pMX
	adkpWQ3+XeeM39dhqiDuNzMivZ/KvzONIT8uiO0wR2/W/K4CZmRUOSwWlAwdzhJMX43O
	mEMkrwt/CxNFVPiohzuVOI7wpybUUdO1VS65QfY55Nq+wGV1EOs46U48vk1tazwRtpTz
	Ls3w==
X-Received: by 10.224.160.83 with SMTP id m19mr37418656qax.21.1391941754354;
	Sun, 09 Feb 2014 02:29:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Sun, 9 Feb 2014 02:28:53 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Sun, 9 Feb 2014 08:28:53 -0200
Message-ID: <CAMCfZKFW8mb1d=Q2eJ9mRx8xprbN2dHUQJwZvG-UkUF5Q6TRXw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: xbmc build failing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Feb 2014 10:29:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Folks,

I'm trying to get xbcm built for beaglebone black (dora branch), but it's
failing.

I'm having the same issue as this e-mail sent 2 months ago:
http://lists.openembedded.org/pipermail/openembedded-devel/2013-November/093304.html

Searching on internet I couldn't find any fix.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

