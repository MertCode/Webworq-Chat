import { usePage } from "@inertiajs/react";
import AuthenticatedLayout from "@Layouts/AuthenticatedLayout";



const ChatLayout = ({ Children }) => {

    const page = usePage();
    const conversations = page.props.conversations;
    const selectedConversation = page.props.selectedConversation;


    console.log("conversations", conversations);
    console.log("selectedConversations", selectedConversation);
    return (
        <AuthenticatedLayout>
            Chat Layoutzddzd
            <div> {Children}</div>
        </AuthenticatedLayout>

    );

}

export default ChatLayout;
