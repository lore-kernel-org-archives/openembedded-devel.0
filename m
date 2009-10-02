Received: from [209.85.222.124] (helo=mail-pz0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mail@april1985.com>) id 1MtjqK-0005lm-4O
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 17:14:51 +0200
Received: by pzk30 with SMTP id 30so59443pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2009 08:14:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.143.27.38 with SMTP id e38mr334489wfj.221.1254496441879; Fri, 
	02 Oct 2009 08:14:01 -0700 (PDT)
Date: Fri, 2 Oct 2009 23:14:01 +0800
Message-ID: <fd72b8f50910020814n1e60b294oc99993cf8d26a17a@mail.gmail.com>
From: mail mail <mail@april1985.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.124
X-SA-Exim-Mail-From: mail@april1985.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: no action_wpa.sh file
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
X-List-Received-Date: Fri, 02 Oct 2009 15:14:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I'm building console-image of openmoko on mini2440, but got:
NOTE: Unpacking recipes/wpa-supplicant/files/action_wpa.sh to
../tmp/work/armv4t-angstrom-linux-gnueabi/wpa-supplicant-0.6.3-r2/
cp: cannot stat
`/home/derek/mini2440/oe/openembedded/recipes/wpa-supplicant/files/action_wpa.sh':
No such file or directory
NOTE: Task failed:
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/derek/mini2440/oe/openembedded/recipes/wpa-supplicant/
wpa-supplicant_0.6.3.bb do_unpack failed
ERROR: Task 322
(/home/derek/mini2440/oe/openembedded/recipes/wpa-supplicant/
wpa-supplicant_0.6.3.bb, do_unpack) failed

Can anyone fix this problem?

