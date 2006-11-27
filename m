Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nicolasfr@gmail.com>) id 1Gonf3-00071P-RN
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Nov 2006 22:05:09 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1072868ugf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2006 13:05:01 -0800 (PST)
Received: by 10.78.117.10 with SMTP id p10mr92271huc.1164661500380;
	Mon, 27 Nov 2006 13:05:00 -0800 (PST)
Received: by 10.78.160.8 with HTTP; Mon, 27 Nov 2006 13:05:00 -0800 (PST)
Message-ID: <b9481e140611271305j26d156e8r3fb35fb3ff35be68@mail.gmail.com>
Date: Mon, 27 Nov 2006 22:05:00 +0100
From: "Nicolas FR" <nicolasfr@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Small fix for sharprom
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2006 21:05:10 -0000
Content-Type: multipart/mixed; 
	boundary="----=_Part_62780_26118828.1164661500332"

------=_Part_62780_26118828.1164661500332
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The bugtracker seems down for a few days, so I post this here.

I have been playing with disto = sharprom-compatible for a few days.
So here is a small patch to palmtop.bbclass to make gcc-2.95 happy
when building opie stuff (seem the first patch made here was wrong,
removing libstd++ instead of removing libsupc++):

Nicolas.

------=_Part_62780_26118828.1164661500332--
