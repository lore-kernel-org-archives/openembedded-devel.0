Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1RVkg4-0007en-Pk
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 14:58:26 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob109.postini.com ([207.126.147.11]) with SMTP
	ID DSNKTtY08gerK0Ch1k8AI6mgB/4FO/uLRqe0@postini.com;
	Wed, 30 Nov 2011 13:51:46 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1E1B12D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 10:20:27 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D90C71B79
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 10:20:26 +0000 (GMT)
Received: from ctn005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.1.8-GA)
	with ESMTP id AKM05633 (AUTH condorg);
	Wed, 30 Nov 2011 11:20:26 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Nov 2011 11:20:24 +0100
Message-ID: <01e301ccaf49$ad5a6e40$080f4ac0$@condorelli@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcyvSatxHl6Sl6jwTIquUg6UVFkKGQ==
x-cr-hashedpuzzle: ADfI A/jX Bv+f DQrA DhMz Dvt3 Elnc Em79 FQre FsYj Fx7I GEmH
	Hg3s JxEe LG7O LNLJ; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {CF630C84-9764-43C9-9A54-4B32DBFF2704};
	ZwBpAHUAcwBlAHAAcABlAC4AYwBvAG4AZABvAHIAZQBsAGwAaQBAAHMAdAAuAGMAbwBtAA==;
	Wed, 30 Nov 2011 10:20:23 GMT;
	WwBvAGUAXQAgAFcAYQBuAHQAIAB0AG8AIABjAGgAYQBuAGcAZQAgAGIAYQBzAGUAXwBwAHIAZQBmAGkAeAAgAGkAbgBzAHQAYQBsAGwAYQB0AGkAbwBuACAAcABhAHQAaAA=
x-cr-puzzleid: {CF630C84-9764-43C9-9A54-4B32DBFF2704}
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Want to change base_prefix installation path
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
X-List-Received-Date: Wed, 30 Nov 2011 13:58:26 -0000
Content-Language: en-us
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

 

I need to change the file installation path of the target packages. I mean,
I need to have set a different path in the .spec file (talking about rpm
installation)

for the installed files contained in the %files directive. I think this
should be obtained setting base_prefix accordingly.

 

Suggestions are welcome.

May thanks,

Giuseppe


