Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PI3qP-0008DR-NT
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 19:32:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5A8268EB093
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 13:30:42 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25207-04 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 15 Nov 2010 13:30:42 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 21D868F468F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 13:30:42 -0500 (EST)
Message-ID: <4CE17C50.7050506@cbnco.com>
Date: Mon, 15 Nov 2010 13:30:40 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1289845231-29982-1-git-send-email-dvorkin@tibbo.com>
In-Reply-To: <1289845231-29982-1-git-send-email-dvorkin@tibbo.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pstree: added reciept
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
X-List-Received-Date: Mon, 15 Nov 2010 18:32:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dvorkin Dmitry wrote:
> Signed-off-by: Dvorkin Dmitry <dvorkin@tibbo.com>
> ---
>  recipes/pstree/pstree_2.33.bb |   23 +++++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/pstree/pstree_2.33.bb

Thanks, pushed.

In future if you send a second or third version of the patch, you can 
change [PATCH] to [PATCH v2]. It makes it a bit easier to spot in 
Patchwork (http://patchwork.openembedded.org/).

Mike


