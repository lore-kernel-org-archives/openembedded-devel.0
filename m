Received: from smtp112.biz.mail.sp1.yahoo.com ([69.147.92.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <tejas@picus.in>) id 1NtelE-0004Mf-JU
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 11:21:31 +0100
Received: (qmail 17487 invoked from network); 22 Mar 2010 10:11:39 -0000
Received: from user2-PC (tejas@117.241.18.228 with login)
	by smtp112.biz.mail.sp1.yahoo.com with SMTP;
	22 Mar 2010 03:11:38 -0700 PDT
X-Yahoo-SMTP: vL6ZkSyswBA8eZdwmFTvr8l2__OJ14.9dJSX
X-YMail-OSG: PH4yc8YVM1kjhvObJlum9uYua_Ap6qVlEuFyLieYFd.hhSZfoUxl7fd.jnSuu1j95GvM7aPc1HkvqYpaJ36Lhbv2P0f0TlFgVFBqxO6e4fzbcgoNMQGA3dwWv7fwLStBYXn1ZCU9kQQbuduUp45FscnDek81GxDjbxW9Uwo8542qR6vFQlFlwT19j52isbh.Dfod_1hAvvsMbt6mFdlLfd9b3YV5W0VR8kgdDzJa7ySjcRfIAuWmBaqBD5QrBz.v
X-Yahoo-Newman-Property: ymail-3
From: "Tejas" <tejas@picus.in>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Mar 2010 15:43:59 +0530
Message-ID: <000001cac9a8$63534250$29f9c6f0$@in>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcrJqGHzTjSfpncTQTirYij7sxWUcg==
x-cr-hashedpuzzle: Au0s BcoK BfpT CR0S C0Lk ELMN EUJ/ EZBV FGdM FpLS GzIp I+qn
	JINg JcxI Jl4Y KLhQ; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {58D0551D-C85B-4C72-A04A-6E3EE40BF0E2};
	dABlAGoAYQBzAEAAcABpAGMAdQBzAC4AaQBuAA==;
	Mon, 22 Mar 2010 10:13:56 GMT;
	VwBhAG4AdAAgAHQAbwAgAFIAZQAgAGIAdQBpAGwAZAAgAGEAZgB0AGUAcgAgAG0AbwBkAGkAZgB5AGkAbgBnACAAYQBuAHkAIABmAGkAbABlAHMA
x-cr-puzzleid: {58D0551D-C85B-4C72-A04A-6E3EE40BF0E2}
X-SA-Exim-Connect-IP: 69.147.92.225
X-SA-Exim-Mail-From: tejas@picus.in
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_20,HTML_MESSAGE,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Want to Re build after modifying any files
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
X-List-Received-Date: Mon, 22 Mar 2010 10:21:32 -0000
Content-Language: en-us
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello All,

               I have removed INHERIT += " rm_work "  option from my
local.conf file. So I can avail source code.

 

               The problem which I am facing is, I have built gst-omapfb
from openembedded by giving bitbake gst-omapfb. It is built successfully.
Now I am changing code and trying to rebuild it by giving bitbake
gst-omapfb. But it is not rebuilding. 

 

Is there any way to do it ?

 

-Tejas


