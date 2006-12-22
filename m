Received: from [131.188.3.181] (helo=max71.rrze.uni-erlangen.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <Gilbert.Forkel@e-technik.stud.uni-erlangen.de>)
	id 1GxkGm-00004q-5m
	for openembedded-devel@openembedded.org; Fri, 22 Dec 2006 14:17:04 +0100
Received: from max71.rrze.uni-erlangen.de (max71.rrze.uni-erlangen.de
	[131.188.3.181]) by max71.rrze.uni-erlangen.de with ESMTP for
	openembedded-devel@openembedded.org; Fri, 22 Dec 2006 14:13:23 +0100
Received: from max71.rrze.uni-erlangen.de ([131.188.3.181])
	by max71.rrze.uni-erlangen.de (max71.rrze.uni-erlangen.de [127.0.0.1])
	(amavisd-new)
	with ESMTP id 12637-08 for <openembedded-devel@openembedded.org>;
	Fri, 22 Dec 2006 14:13:23 +0100 (MET)
Received: from studmail.uni-erlangen.de ([131.188.3.207] [131.188.3.207]) by
	smtp.uni-erlangen.de with ESMTP for
	openembedded-devel@openembedded.org; Fri, 22 Dec 2006 14:13:23 +0100
Received: from 84.148.98.51 (SquirrelMail authenticated user 
	Gilbert.Forkel@e-technik.stud.uni-erlangen.de)
	by studmail.uni-erlangen.de with HTTP;
	Fri, 22 Dec 2006 14:13:23 +0100 (MET)
Message-Id: <57817.84.148.98.51.1166793203.squirrel@studmail.uni-erlangen.de>
Date: Fri, 22 Dec 2006 14:13:23 +0100 (MET)
From: Gilbert.Forkel@e-technik.stud.uni-erlangen.de
To: openembedded-devel@openembedded.org
User-Agent: SquirrelMail/1.4.9 [CVS]
MIME-Version: 1.0
X-Virus-Scanned: by amavisd-new-20030616 (RRZE) on max71.rrze.uni-erlangen.de
X-Spam-PYZOR: Reported 0 times.
X-Spam-DCC: rrze-dcc:boeck2 1202; Body=1 Fuz1=1 Fuz2=1
X-Spam-Checker-Version: SpamAssassin 3.1.7-rrze_40 (2006-10-05) on
	boeck2.rrze.uni-erlangen.de
X-Spam-Status: No, score=-2.8 tests=ALL_TRUSTED=-3.3, BAYES_50=0.001,
	NO_REAL_NAME=0.461 autolearn=ham
X-Spam-RBL: 
X-Spam-Eval: ham 
X-Spam-RRZE-Info: Diese Mail wurde einer automatischen Spam-Analyse unterzogen, 
	siehe: http://www.rrze.uni-erlangen.de/dienste/e-mail/spam-analyse/
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Cifs support for mountnfs.sh initscript
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
X-List-Received-Date: Fri, 22 Dec 2006 13:17:04 -0000
Content-Type: multipart/mixed;boundary="----=_20061222141323_22907"

------=_20061222141323_22907
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hello,
modified the mountnfs.sh script to handle cifs, the successor of the
popular smb filesystem.

regards
Gilbert Forkel

------=_20061222141323_22907--
