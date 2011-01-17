Received: from asmtpout030.mac.com ([17.148.16.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@mac.com>) id 1Pen6N-0001oP-HX
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 12:18:23 +0100
MIME-version: 1.0
Received: from [192.168.1.30] ([87.201.169.175])
	by asmtp030.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0LF5009UFWLEAW60@asmtp030.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Jan 2011 02:17:42 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
	classifier=spam
	adjust=0 reason=mlx engine=6.0.2-1010190000 definitions=main-1101170028
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.2.15,1.0.148,0.0.0000
	definitions=2011-01-17_04:2011-01-17, 2011-01-17,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Mon, 17 Jan 2011 14:17:16 +0400
Message-id: <42777734-3F25-41F9-8FAD-40B6BF4959A4@mac.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: How to copy local recipe file to target root filesystem /etc folder
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
X-List-Received-Date: Mon, 17 Jan 2011 11:18:23 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi,
      I have an OE recipe that I created to automatically login to the beagleboard. I have added the autologin recipe to the omap3-console-image.bb recipe.

Would someone happen to know what OE command I should insert into a recipe, that will allow me to copy a file from the autologin recipe folder to the target root filesystem /etc folder?

cp inittab-autologin <TARGET-ROOTFS>/etc/inittab
cp autologin.profile <TARGET-ROOTFS>/etc

Elvis Dowson


