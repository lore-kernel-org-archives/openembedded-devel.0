Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1QqcSI-0005y2-U4
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Aug 2011 04:54:11 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LPN00L8S3U3OQ30@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	08 Aug 2011 21:49:21 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 0CFC62; Mon, 08 Aug 2011 21:49:14 -0500
Received: from [192.168.1.5] by rkmorris.us with HTTP; Mon,
	08 Aug 2011 21:49:13 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Mon, 08 Aug 2011 21:49:13 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1312858153686306500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 1
Subject: ISO-Codes Build Failing
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
X-List-Received-Date: Tue, 09 Aug 2011 02:54:11 -0000
Content-type: text/plain
Content-transfer-encoding: quoted-printable
Content-disposition: inline

Hi,

I have been trying to build angstrom-x-image, but it fails - at iso-codes. =
The issue may be because Verizon FIOS is now blocking FTP (as more and more=
 ISP's are), but in any case I created a new recipe to correct this (and it=
 works). How do I get this change in to the official OpenEmbedded build (or=
 can I even?)?

Also ... what is the official OE path? I admit, now with OpenEmbedded, core=
, etc. - it's getting a bit confusing ... :-(. It really seems like (base?)=
 OpenEmbedded is getting quite out of date, but I could be wrong.

On to gs next (which seems to be failing during the do_configure stage).

Thanks,
... Russell


