Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RVSQD-00055Z-H5
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2011 19:28:50 +0100
Received: by ghrr13 with SMTP id r13so2003713ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 10:22:09 -0800 (PST)
Received: by 10.205.118.14 with SMTP id fo14mr52127819bkc.63.1322590928678;
	Tue, 29 Nov 2011 10:22:08 -0800 (PST)
Received: from mobil-400-586.intern.dresearch.de (recycler-gw.in-dsl.de.
	[217.197.85.167])
	by mx.google.com with ESMTPS id fa8sm30496603bkc.14.2011.11.29.10.22.06
	(version=SSLv3 cipher=OTHER); Tue, 29 Nov 2011 10:22:07 -0800 (PST)
Message-ID: <4ED522CD.90606@dresearch-fe.de>
Date: Tue, 29 Nov 2011 19:22:05 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <1322146025-21514-1-git-send-email-sledz@dresearch-fe.de>
	<1322478424-22419-1-git-send-email-sledz@dresearch-fe.de>
	<1322478424-22419-2-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1322478424-22419-2-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.3.3
Cc: openembedded-devel@lists.openembedded.org,
	Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v2 1/3] gypsy: fix packaging of DBus starter script
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
X-List-Received-Date: Tue, 29 Nov 2011 18:28:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2011 12:07, Steffen Sledz wrote:
> A wrong path had avoided the packaging of the dbus starter script
> /usr/share/dbus-1/system-services/org.freedesktop.Gypsy.service.
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

pushed to oe-classic master


