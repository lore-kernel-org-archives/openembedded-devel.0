Received: from [212.27.42.28] (helo=smtp2-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ebenard@free.fr>) id 1L75va-0003uS-VN
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Dec 2008 11:23:23 +0100
Received: from smtp2-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp2-g19.free.fr (Postfix) with ESMTP id 891B512B6F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2008 11:19:34 +0100 (CET)
Received: from [192.168.1.15] (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g19.free.fr (Postfix) with ESMTP id 665F912B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2008 11:19:34 +0100 (CET)
Message-ID: <4933BA35.5010302@free.fr>
Date: Mon, 01 Dec 2008 11:19:33 +0100
From: Eric BENARD <ebenard@free.fr>
User-Agent: Thunderbird 2.0.0.18 (X11/20081105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Checksum patch
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
X-List-Received-Date: Mon, 01 Dec 2008 10:23:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
here is a missing checksums.ini entry :

--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -23582,3 +23582,6 @@ 
sha256=5cc1a53bb909922596bdd0fa967b654fe1bfbe0dcf1d34608f0b7c90e0c27867
  md5=5f7b88ebb2bcd7e8044328482d079661
  sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af

+[http://maxim.org.za/AT91RM9200/2.6/2.6.21-at91.patch.gz]
+md5=779472ae02c2a99937879a8d1d4b9b25
+sha256=cfb98e7635c985733dba0fb9c3cadee22ab70fb3b0db7eac8eacaebc65c92a59


Regards
Eric


