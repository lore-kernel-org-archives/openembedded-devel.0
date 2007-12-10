Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J1l2R-0007gt-FM
	for openembedded-devel@openembedded.org; Mon, 10 Dec 2007 16:59:23 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1J1kyE-0006LG-4Y
	for openembedded-devel@openembedded.org; Mon, 10 Dec 2007 15:55:02 +0000
Received: from iap-pxy-mow1.siemens.ru ([212.248.25.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 10 Dec 2007 15:55:02 +0000
Received: from dbaryshkov by iap-pxy-mow1.siemens.ru with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 10 Dec 2007 15:55:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 10 Dec 2007 18:48:10 +0300
Message-ID: <fjjn3r$57f$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: iap-pxy-mow1.siemens.ru
User-Agent: IceDove 1.5.0.14pre (X11/20071020)
Sender: news <news@ger.gmane.org>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Tosa keyboard
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
X-List-Received-Date: Mon, 10 Dec 2007 15:59:23 -0000
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Currently I'm cleaning up the tosa keyboard stuff.
I have two question:
1) What codes should I use for "misc" keys? Does the comment at 
include/linux/input_pda.h still apply to current kdrive? Or I can safely 
use keycodes > 127 (like KEY_FN, KEY_OK, KEY_CANCEL and company)?
2) How should I update the keymap file for tosa? Should I provide both 
keymaps (old and new ones) and let the user choose which is correct for 
him or can I safely provide only new one?

-- 
With best wishes
Dmitry



