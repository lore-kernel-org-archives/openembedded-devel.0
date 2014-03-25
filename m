Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id BA36C6EA13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 14:55:09 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WSSkp-0001FO-KS for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2014 15:55:06 +0100
Received: from maria-OptiPlex-3010.vsnet.gmu.edu ([129.174.124.82])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 15:55:03 +0100
Received: from mmalik9 by maria-OptiPlex-3010.vsnet.gmu.edu with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 15:55:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: mayamalik <mmalik9@gmu.edu>
Date: Tue, 25 Mar 2014 14:51:20 +0000 (UTC)
Message-ID: <loom.20140325T154806-146@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 129.174.124.82 (Mozilla/5.0 (X11;
	Linux i686 (x86_64)) AppleWebKit/537.36 (KHTML, like Gecko)
	Chrome/32.0.1700.107 Safari/537.36)
Subject: =?UTF-8?B?SW50ZXJjZXB0LmNwcDo2OTo2NzogZXJyb3I6IOKAmGxzZWVrNjTigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3Bl?=
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Mar 2014 14:55:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi
I am trying to build LLVM from the cloudsuite benchmark. However, when I type 
command "make" inside the folder llvm-2.9, I am getting error:

Intercept.cpp:69:67: error: ‘lseek64’ was not declared in this scope. I have 
search and it is suggested to add #include < unistd.h > into Intercept.cpp 
file. But I am still getting the above error.

Any idea to solve this issue will be great.
Thanks,


