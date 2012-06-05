Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SbzdL-0003CN-Ik
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 21:41:39 +0200
Received: by wibhm14 with SMTP id hm14so3793897wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=bXmH2D+7uZLcLMdJ08zoq8yyeWiA5XztIPfvpI/CDUg=;
	b=D0T4OMrFpBULLr7lT+Ghd+zKrc7LFL5fws/2MAcqMIkOdL1nwllbbvGiFmRrmNGslB
	9KNVlbErl3YYjWIA/NqGXKxzHzO//u/8eReyqNPwsHHmMt2YBMROCbOyj9TDL3f6kc6z
	5m+FB/NxV1E0GsJR9rMoWtXz83yVB/BQ+lBfo/WYrGjlX4udHEVB0rmZy7tWh6wZnsyV
	V1fLEKX4SzruVR5BJphxPHb4HqlP638pTKeWkrRFLPnNB9vfM923uNnSVJNS6XvGz0/K
	uz2eZDNGdYP8NfvDn6dplWouTeI+7TlKXmBhY4cb8vvY+IJcshBNMpAlGjjIaSfUbUYl
	M4ag==
Received: by 10.216.142.146 with SMTP id i18mr15261450wej.74.1338924673375;
	Tue, 05 Jun 2012 12:31:13 -0700 (PDT)
Received: from [192.168.1.36] (1.Red-83-60-183.dynamicIP.rima-tde.net.
	[83.60.183.1])
	by mx.google.com with ESMTPS id et10sm28840516wib.2.2012.06.05.12.31.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jun 2012 12:31:12 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 5 Jun 2012 21:31:09 +0200
Message-Id: <0A3F8C22-BFEA-4496-BC09-D86717640DE7@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: [poky] Updating qemu recipes
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
X-List-Received-Date: Tue, 05 Jun 2012 19:41:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      The qemu recipes are a bit old at 0.15.1. The latest release =
appears to be at v1.1.0.

I notice that there are a bunch of patches inside the qemu-0.15.1 recipe =
folder. Would it be safe to assume that all these patches have made it's =
way to the latest v1.1.0 release?

Perhaps I could just update the qemu_git.bb recipe, since that is behind =
at 0.14.

Best regards,

Elvis Dowson=


