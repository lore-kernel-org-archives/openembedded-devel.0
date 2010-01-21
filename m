Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NXweD-0005Wb-Ni
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 14:00:33 +0100
Received: (qmail 14298 invoked by uid 1003); 21 Jan 2010 12:58:11 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 21 Jan 2010 12:58:11 -0000
Message-ID: <4B584F62.1050406@balister.org>
Date: Thu, 21 Jan 2010 07:58:10 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Number 1 tip for getting your patch committed
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
X-List-Received-Date: Thu, 21 Jan 2010 13:00:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Follow the commit log message policy at:

http://wiki.openembedded.net/index.php/Commit_log_example

and use git send-email to send the patch to the list. If you do this, it 
makes the act of retrieving the patch from patchwork trivial (see 
contrib/patchwprk/pw-am.sh).

This leaves you in a position where you can discuss the patch with 
someone with commit access and they can easily apply and push the patch.

Thanks,

Philip


